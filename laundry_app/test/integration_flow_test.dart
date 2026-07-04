import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:laundry_app/core/network/api_result.dart';
import 'package:laundry_app/core/network/dio_client.dart';
import 'package:laundry_app/core/storage/secure_storage.dart';
import 'package:laundry_app/features/agent/data/agent_repository.dart';
import 'package:laundry_app/features/auth/data/auth_repository.dart';
import 'package:laundry_app/features/challans/data/models/challan_models.dart';
import 'package:laundry_app/features/setup/data/models/setup_models.dart';

class MockDio extends Mock implements Dio {}

class MockSecureStorage extends Mock implements SecureStorage {}

class _TestDioClient extends DioClient {
  _TestDioClient(this.mockDio) : super(baseUrl: 'http://test', secureStorage: MockSecureStorage());
  final Dio mockDio;

  @override
  Dio get dio => mockDio;

  @override
  Future<ApiResult<T>> request<T>(
    Future<Response<dynamic>> Function(Dio dio) request,
    T Function(dynamic data) parser,
  ) async {
    try {
      final response = await request(mockDio);
      return Success(parser(response.data));
    } on DioException catch (e, st) {
      return Failure(_mapError(e), st);
    } catch (e, st) {
      return Failure(ServerException(e.toString()), st);
    }
  }

  AppException _mapError(DioException e) {
    if (e.response == null) return const NetworkException();
    final status = e.response!.statusCode;
    final data = e.response!.data;
    final detail = (data is Map && data.containsKey('detail'))
        ? data['detail'].toString()
        : 'Error';
    return switch (status) {
      401 => UnauthorizedException(detail),
      403 => ForbiddenException(detail),
      409 => ConflictException(detail),
      422 => ValidationException(detail),
      _ => ServerException(detail),
    };
  }
}

void main() {
  late MockDio mockDio;
  late _TestDioClient dioClient;

  setUp(() {
    mockDio = MockDio();
    dioClient = _TestDioClient(mockDio);
  });

  group('7E: Full agent pickup flow', () {
    test('login → get form schema → submit pickup → verify response', () async {
      // 1. Login
      when(() => mockDio.post(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: {'access_token': 'jwt.agent.token', 'token_type': 'bearer'},
      ));

      final authRepo = AuthRepository(dioClient: dioClient);
      final loginResult = await authRepo.loginWithGoogle('google-id-token');
      expect(loginResult, isA<Success<TokenResponse>>());

      // 2. Get form schema
      when(() => mockDio.get(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: {
          'hotel_id': 'h-1',
          'departments': [
            {
              'dept_id': 'd-1', 'name': 'Housekeeping',
              'billing_type': 'WEIGHT', 'price_per_kg': '25.50',
              'weight_source': 'SOILED',
              'items': [
                {'item_id': 'i-1', 'name': 'Bedsheet', 'price_per_piece': '5.00', 'calculated_weight': '0.5000'},
              ],
            },
          ],
        },
      ));

      final agentRepo = AgentRepository(dioClient: dioClient);
      final schemaResult = await agentRepo.getFormSchema('h-1');
      expect(schemaResult, isA<Success<FormSchemaResponse>>());
      final schema = (schemaResult as Success<FormSchemaResponse>).data;
      expect(schema.departments[0].name, 'Housekeeping');

      // 3. Submit pickup
      reset(mockDio);
      when(() => mockDio.post(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 201,
        data: {
          'id': 'c-1', 'challan_type': 'PICKUP', 'challan_number': 'P-001',
          'hotel_id': 'h-1', 'agent_id': 'a-1',
          'image_key': null, 'entry_timestamp': '2026-04-04T10:00:00Z',
          'last_edited_at': null, 'edited_by': null,
          'departments': [
            {
              'id': 'cd-1', 'dept_id': 'd-1', 'soiled_weight': '5.20', 'fresh_weight': null,
              'items': [{'id': 'ci-1', 'item_id': 'i-1', 'qty': 10, 'damaged_qty': 1}],
            },
          ],
        },
      ));

      final pickupResult = await agentRepo.submitPickup(PickupSubmitRequest(
        challanNumber: 'P-001',
        hotelId: 'h-1',
        departments: [
          ChallanDeptPayload(deptId: 'd-1', soiledWeight: 5.2, items: [
            ChallanItemPayload(itemId: 'i-1', qty: 10, damagedQty: 1),
          ]),
        ],
      ));

      expect(pickupResult, isA<Success<ChallanResponse>>());
      final challan = (pickupResult as Success<ChallanResponse>).data;
      expect(challan.challanNumber, 'P-001');
      expect(challan.departments[0].soiledWeight, '5.20');
      expect(challan.departments[0].items[0].qty, 10);
    });
  });

  group('7E: Full delivery flow', () {
    test('get pending deliveries → submit delivery → verify', () async {
      // 1. Get pending deliveries
      when(() => mockDio.get(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: [
          {
            'id': 'c-1', 'challan_type': 'PICKUP', 'challan_number': 'P-001',
            'hotel_id': 'h-1', 'agent_id': 'a-1',
            'image_key': null, 'entry_timestamp': '2026-04-04T10:00:00Z',
            'last_edited_at': null, 'edited_by': null,
            'departments': [
              {
                'id': 'cd-1', 'dept_id': 'd-1', 'soiled_weight': '5.20', 'fresh_weight': null,
                'items': [{'id': 'ci-1', 'item_id': 'i-1', 'qty': 10, 'damaged_qty': 1}],
              },
            ],
          },
        ],
      ));

      final agentRepo = AgentRepository(dioClient: dioClient);
      final pendingResult = await agentRepo.getPendingDeliveries('h-1');
      expect(pendingResult, isA<Success<List<ChallanResponse>>>());
      final pending = (pendingResult as Success<List<ChallanResponse>>).data;
      expect(pending.length, 1);
      expect(pending[0].challanNumber, 'P-001');

      // 2. Submit delivery using same CN
      reset(mockDio);
      when(() => mockDio.post(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 201,
        data: {
          'id': 'c-2', 'challan_type': 'DELIVERY', 'challan_number': 'P-001',
          'hotel_id': 'h-1', 'agent_id': 'a-1',
          'image_key': null, 'entry_timestamp': '2026-04-04T11:00:00Z',
          'last_edited_at': null, 'edited_by': null,
          'departments': [
            {
              'id': 'cd-2', 'dept_id': 'd-1', 'soiled_weight': null, 'fresh_weight': '4.80',
              'items': [{'id': 'ci-2', 'item_id': 'i-1', 'qty': 9, 'damaged_qty': 0}],
            },
          ],
        },
      ));

      final deliveryResult = await agentRepo.submitDelivery(DeliverySubmitRequest(
        challanNumber: 'P-001',
        hotelId: 'h-1',
        departments: [
          ChallanDeptPayload(deptId: 'd-1', freshWeight: 4.8, items: [
            ChallanItemPayload(itemId: 'i-1', qty: 9),
          ]),
        ],
      ));

      expect(deliveryResult, isA<Success<ChallanResponse>>());
      final delivery = (deliveryResult as Success<ChallanResponse>).data;
      expect(delivery.challanType, 'DELIVERY');
      expect(delivery.departments[0].freshWeight, '4.80');
    });
  });

  group('7E: Over-delivery rejection', () {
    test('backend rejects delivery of more items than picked up', () async {
      when(() => mockDio.post(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 422,
          data: {'detail': 'Cannot deliver 50 of item Bedsheet; only 30 in laundry'},
        ),
        type: DioExceptionType.badResponse,
      ));

      final agentRepo = AgentRepository(dioClient: dioClient);
      final result = await agentRepo.submitDelivery(DeliverySubmitRequest(
        challanNumber: 'P-001',
        hotelId: 'h-1',
        departments: [
          ChallanDeptPayload(deptId: 'd-1', items: [
            ChallanItemPayload(itemId: 'i-1', qty: 50),
          ]),
        ],
      ));

      expect(result, isA<Failure<ChallanResponse>>());
      final failure = result as Failure<ChallanResponse>;
      expect(failure.exception, isA<ValidationException>());
      expect(failure.exception.message, contains('Cannot deliver 50'));
    });
  });

  group('7E: Edit flow', () {
    test('edit challan within 24h succeeds', () async {
      when(() => mockDio.patch(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: {
          'id': 'c-1', 'challan_type': 'PICKUP', 'challan_number': 'P-001',
          'hotel_id': 'h-1', 'agent_id': 'a-1',
          'image_key': null, 'entry_timestamp': '2026-04-04T10:00:00Z',
          'last_edited_at': '2026-04-04T11:00:00Z', 'edited_by': 'a-1',
          'departments': [
            {
              'id': 'cd-1', 'dept_id': 'd-1', 'soiled_weight': '6.00', 'fresh_weight': null,
              'items': [{'id': 'ci-1', 'item_id': 'i-1', 'qty': 12, 'damaged_qty': 2}],
            },
          ],
        },
      ));

      final agentRepo = AgentRepository(dioClient: dioClient);
      final result = await agentRepo.editChallan('c-1', ChallanEditRequest(
        departments: [
          ChallanDeptPayload(deptId: 'd-1', soiledWeight: 6.0, items: [
            ChallanItemPayload(itemId: 'i-1', qty: 12, damagedQty: 2),
          ]),
        ],
      ));

      expect(result, isA<Success<ChallanResponse>>());
      final edited = (result as Success<ChallanResponse>).data;
      expect(edited.lastEditedAt, isNotNull);
      expect(edited.departments[0].soiledWeight, '6.00');
      expect(edited.departments[0].items[0].qty, 12);
    });

    test('edit challan after 24h is rejected', () async {
      when(() => mockDio.patch(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 403,
          data: {'detail': 'Challan can only be edited within 24 hours of creation'},
        ),
        type: DioExceptionType.badResponse,
      ));

      final agentRepo = AgentRepository(dioClient: dioClient);
      final result = await agentRepo.editChallan('c-old', ChallanEditRequest(
        departments: [],
      ));

      expect(result, isA<Failure<ChallanResponse>>());
      final failure = result as Failure<ChallanResponse>;
      expect(failure.exception, isA<ForbiddenException>());
      expect(failure.exception.message, contains('24 hours'));
    });
  });

  group('7E: Cross-role isolation', () {
    test('hotel admin accessing another hotel returns 403', () async {
      when(() => mockDio.get(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 403,
          data: {'detail': 'Not authorized to access this hotel'},
        ),
        type: DioExceptionType.badResponse,
      ));

      final agentRepo = AgentRepository(dioClient: dioClient);
      final result = await agentRepo.getFormSchema('other-hotel-id');

      expect(result, isA<Failure<FormSchemaResponse>>());
      final failure = result as Failure<FormSchemaResponse>;
      expect(failure.exception, isA<ForbiddenException>());
    });

    test('agent accessing admin endpoint returns 403', () async {
      when(() => mockDio.get(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 403,
          data: {'detail': 'Super admin access required'},
        ),
        type: DioExceptionType.badResponse,
      ));

      final agentRepo = AgentRepository(dioClient: dioClient);
      final result = await agentRepo.getChallanHistory('h-1');

      expect(result, isA<Failure<PaginatedChallanResponse>>());
      expect((result as Failure).exception, isA<ForbiddenException>());
    });

    test('duplicate challan number returns 409', () async {
      when(() => mockDio.post(any(), data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'), options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'), onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 409,
          data: {'detail': "A pickup challan with number 'P-001' already exists for this hotel"},
        ),
        type: DioExceptionType.badResponse,
      ));

      final agentRepo = AgentRepository(dioClient: dioClient);
      final result = await agentRepo.submitPickup(PickupSubmitRequest(
        challanNumber: 'P-001',
        hotelId: 'h-1',
        departments: [],
      ));

      expect(result, isA<Failure<ChallanResponse>>());
      final failure = result as Failure<ChallanResponse>;
      expect(failure.exception, isA<ConflictException>());
      expect(failure.exception.message, contains('already exists'));
    });
  });

  group('7E: Data consistency', () {
    test('challan JSON survives encode/decode cycle', () {
      final challanJson = {
        'id': 'c-1', 'challan_type': 'PICKUP', 'challan_number': 'P-001',
        'hotel_id': 'h-1', 'agent_id': 'a-1', 'image_key': null,
        'entry_timestamp': '2026-04-04T10:00:00Z',
        'last_edited_at': null, 'edited_by': null,
        'departments': [
          {
            'id': 'cd-1', 'dept_id': 'd-1', 'soiled_weight': '5.20', 'fresh_weight': null,
            'items': [
              {'id': 'ci-1', 'item_id': 'i-1', 'qty': 10, 'damaged_qty': 1},
              {'id': 'ci-2', 'item_id': 'i-2', 'qty': 5, 'damaged_qty': 0},
            ],
          },
          {
            'id': 'cd-2', 'dept_id': 'd-2', 'soiled_weight': null, 'fresh_weight': null,
            'items': [
              {'id': 'ci-3', 'item_id': 'i-3', 'qty': 100, 'damaged_qty': 5},
            ],
          },
        ],
      };

      final encoded = jsonEncode(challanJson);
      final decoded = jsonDecode(encoded) as Map<String, dynamic>;
      final model = ChallanResponse.fromJson(decoded);

      expect(model.departments.length, 2);
      expect(model.departments[0].items.length, 2);
      expect(model.departments[1].items[0].qty, 100);

      final reEncoded = jsonEncode(model.toJson());
      final reDecoded = jsonDecode(reEncoded) as Map<String, dynamic>;
      final reModel = ChallanResponse.fromJson(reDecoded);

      expect(reModel.challanNumber, model.challanNumber);
      expect(reModel.departments.length, model.departments.length);
    });
  });
}
