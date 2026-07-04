import 'package:drift/drift.dart';

import '../../../core/storage/app_database.dart';

class PendingChallanService {
  const PendingChallanService({required AppDatabase database}) : _db = database;
  final AppDatabase _db;

  Future<int> save({
    required String challanType,
    required String payloadJson,
  }) async {
    return _db.into(_db.pendingChallans).insert(
          PendingChallansCompanion.insert(
            challanType: challanType,
            payloadJson: payloadJson,
          ),
        );
  }

  Future<List<PendingChallan>> getAll() {
    return (_db.select(_db.pendingChallans)
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  Future<int> getPendingCount() async {
    final count = _db.pendingChallans.id.count();
    final query = _db.selectOnly(_db.pendingChallans)
      ..addColumns([count])
      ..where(_db.pendingChallans.status.equals('pending'));
    final row = await query.getSingle();
    return row.read(count) ?? 0;
  }

  Stream<int> watchPendingCount() {
    final count = _db.pendingChallans.id.count();
    final query = _db.selectOnly(_db.pendingChallans)
      ..addColumns([count])
      ..where(_db.pendingChallans.status.isIn(['pending', 'failed']));
    return query.watchSingle().map((row) => row.read(count) ?? 0);
  }

  Future<void> updateStatus(
    int id,
    String status, {
    String? errorMessage,
  }) async {
    await (_db.update(_db.pendingChallans)
          ..where((t) => t.id.equals(id)))
        .write(
      PendingChallansCompanion(
        status: Value(status),
        errorMessage: Value(errorMessage),
      ),
    );
  }

  Future<void> incrementRetry(int id) async {
    final row = await (_db.select(_db.pendingChallans)
          ..where((t) => t.id.equals(id)))
        .getSingle();

    await (_db.update(_db.pendingChallans)
          ..where((t) => t.id.equals(id)))
        .write(
      PendingChallansCompanion(
        retryCount: Value(row.retryCount + 1),
      ),
    );
  }

  Future<void> delete(int id) async {
    await (_db.delete(_db.pendingChallans)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  Future<void> deleteCompleted() async {
    await (_db.delete(_db.pendingChallans)
          ..where((t) => t.status.isIn(['synced', 'completed'])))
        .go();
  }
}
