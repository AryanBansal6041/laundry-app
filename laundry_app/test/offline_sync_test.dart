import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laundry_app/core/storage/app_database.dart';
import 'package:laundry_app/features/agent/data/pending_challan_service.dart';

AppDatabase _createTestDatabase() {
  return AppDatabase(NativeDatabase.memory());
}

void main() {
  late AppDatabase db;
  late PendingChallanService service;

  setUp(() {
    db = _createTestDatabase();
    service = PendingChallanService(database: db);
  });

  tearDown(() async {
    await db.close();
  });

  group('7C: PendingChallanService — save & retrieve', () {
    test('saves a pending challan and retrieves it', () async {
      final payload = jsonEncode({
        'challan_number': 'P-OFFLINE-001',
        'hotel_id': 'h-1',
        'departments': [],
      });

      final id = await service.save(challanType: 'PICKUP', payloadJson: payload);
      expect(id, isPositive);

      final all = await service.getAll();
      expect(all.length, 1);
      expect(all[0].challanType, 'PICKUP');
      expect(all[0].status, 'pending');
      expect(all[0].retryCount, 0);
      expect(all[0].errorMessage, isNull);
    });

    test('getAll returns in creation order', () async {
      await service.save(challanType: 'PICKUP', payloadJson: '{"n":1}');
      await service.save(challanType: 'DELIVERY', payloadJson: '{"n":2}');
      await service.save(challanType: 'PICKUP', payloadJson: '{"n":3}');

      final all = await service.getAll();
      expect(all.length, 3);
      expect(all[0].challanType, 'PICKUP');
      expect(all[1].challanType, 'DELIVERY');
      expect(all[2].challanType, 'PICKUP');
      expect(all[0].id, lessThan(all[1].id));
      expect(all[1].id, lessThan(all[2].id));
    });
  });

  group('7C: PendingChallanService — status updates', () {
    test('updateStatus marks as synced', () async {
      final id = await service.save(challanType: 'PICKUP', payloadJson: '{}');
      await service.updateStatus(id, 'synced');

      final all = await service.getAll();
      expect(all[0].status, 'synced');
    });

    test('updateStatus marks as failed with error message', () async {
      final id = await service.save(challanType: 'PICKUP', payloadJson: '{}');
      await service.updateStatus(id, 'failed', errorMessage: 'Server error 500');

      final all = await service.getAll();
      expect(all[0].status, 'failed');
      expect(all[0].errorMessage, 'Server error 500');
    });

    test('incrementRetry increases retry count', () async {
      final id = await service.save(challanType: 'PICKUP', payloadJson: '{}');
      expect((await service.getAll())[0].retryCount, 0);

      await service.incrementRetry(id);
      expect((await service.getAll())[0].retryCount, 1);

      await service.incrementRetry(id);
      expect((await service.getAll())[0].retryCount, 2);
    });

    test('simulate max retries then fail', () async {
      final id = await service.save(challanType: 'PICKUP', payloadJson: '{}');

      const maxRetries = 5;
      for (var i = 0; i < maxRetries; i++) {
        await service.incrementRetry(id);
      }

      final row = (await service.getAll())[0];
      expect(row.retryCount, maxRetries);

      if (row.retryCount >= maxRetries) {
        await service.updateStatus(id, 'failed', errorMessage: 'Max retries exceeded');
      }

      final updated = (await service.getAll())[0];
      expect(updated.status, 'failed');
      expect(updated.errorMessage, 'Max retries exceeded');
    });
  });

  group('7C: PendingChallanService — counting', () {
    test('getPendingCount counts only pending items', () async {
      await service.save(challanType: 'PICKUP', payloadJson: '{}');
      final id2 = await service.save(challanType: 'DELIVERY', payloadJson: '{}');
      await service.save(challanType: 'PICKUP', payloadJson: '{}');

      expect(await service.getPendingCount(), 3);

      await service.updateStatus(id2, 'synced');
      expect(await service.getPendingCount(), 2);
    });

    test('watchPendingCount emits updates (pending + failed)', () async {
      final id1 = await service.save(challanType: 'PICKUP', payloadJson: '{}');
      await service.save(challanType: 'DELIVERY', payloadJson: '{}');

      final stream = service.watchPendingCount();
      final first = await stream.first;
      expect(first, 2);

      await service.updateStatus(id1, 'failed', errorMessage: 'err');
      final second = await stream.first;
      expect(second, 2);

      await service.updateStatus(id1, 'synced');
      final third = await stream.first;
      expect(third, 1);
    });
  });

  group('7C: PendingChallanService — deletion', () {
    test('delete removes a specific row', () async {
      final id1 = await service.save(challanType: 'PICKUP', payloadJson: '{"a":1}');
      await service.save(challanType: 'DELIVERY', payloadJson: '{"b":2}');

      await service.delete(id1);
      final all = await service.getAll();
      expect(all.length, 1);
      expect(all[0].challanType, 'DELIVERY');
    });

    test('deleteCompleted removes synced and completed rows', () async {
      final id1 = await service.save(challanType: 'PICKUP', payloadJson: '{}');
      final id2 = await service.save(challanType: 'DELIVERY', payloadJson: '{}');
      await service.save(challanType: 'PICKUP', payloadJson: '{}');

      await service.updateStatus(id1, 'synced');
      await service.updateStatus(id2, 'completed');

      await service.deleteCompleted();
      final all = await service.getAll();
      expect(all.length, 1);
      expect(all[0].status, 'pending');
    });
  });

  group('7C: PendingChallanService — offline sync simulation', () {
    test('full lifecycle: save → retry → retry → sync → cleanup', () async {
      final id = await service.save(
        challanType: 'PICKUP',
        payloadJson: jsonEncode({
          'challan_number': 'P-OFF-001',
          'hotel_id': 'h-1',
          'departments': [
            {'dept_id': 'd-1', 'items': [{'item_id': 'i-1', 'qty': 10}]}
          ],
        }),
      );

      var row = (await service.getAll())[0];
      expect(row.status, 'pending');
      expect(row.retryCount, 0);

      await service.incrementRetry(id);
      await service.updateStatus(id, 'failed', errorMessage: 'Network timeout');
      row = (await service.getAll())[0];
      expect(row.retryCount, 1);
      expect(row.status, 'failed');

      await service.updateStatus(id, 'pending');
      await service.incrementRetry(id);
      await service.updateStatus(id, 'synced');

      row = (await service.getAll())[0];
      expect(row.status, 'synced');
      expect(row.retryCount, 2);

      await service.deleteCompleted();
      expect(await service.getAll(), isEmpty);
    });

    test('4xx response → mark as failed permanently', () async {
      final id = await service.save(challanType: 'PICKUP', payloadJson: '{}');

      await service.updateStatus(id, 'failed',
          errorMessage: '400: Validation error - missing challan_number');

      final row = (await service.getAll())[0];
      expect(row.status, 'failed');
      expect(row.errorMessage, contains('Validation error'));
    });
  });
}
