import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:laundry_app/core/network/api_result.dart';
import 'package:laundry_app/core/network/dio_client.dart';
import 'package:laundry_app/core/storage/secure_storage.dart';
import 'package:laundry_app/features/auth/data/auth_repository.dart';
import 'package:laundry_app/features/agent/data/agent_repository.dart';
import 'package:laundry_app/features/challans/data/models/challan_models.dart';

class MockDio extends Mock implements Dio {}

class MockSecureStorage extends Mock implements SecureStorage {}

class FakeDioClient extends DioClient {
  FakeDioClient(this.mockDio) : super(baseUrl: 'http://test', secureStorage: MockSecureStorage());

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
      return Failure(_mapStatusToException(e), st);
    } catch (e, st) {
      return Failure(ServerException(e.toString()), st);
    }
  }

  AppException _mapStatusToException(DioException e) {
    if (e.response == null) return const NetworkException();
    final status = e.response!.statusCode;
    final detail = _extractDetail(e.response!.data);
    return switch (status) {
      401 => UnauthorizedException(detail),
      403 => ForbiddenException(detail),
      400 => ValidationException(detail),
      404 => NotFoundException(detail),
      409 => ConflictException(detail),
      _ => ServerException(detail),
    };
  }

  String _extractDetail(dynamic data) {
    if (data is Map<String, dynamic> && data.containsKey('detail')) {
      final detail = data['detail'];
      if (detail is String) return detail;
      return detail.toString();
    }
    return 'An unexpected error occurred';
  }
}

class FakeRequestOptions extends Fake implements RequestOptions {}

void main() {
  late MockDio mockDio;
  late FakeDioClient dioClient;

  setUpAll(() {
    registerFallbackValue(FakeRequestOptions());
  });

  setUp(() {
    mockDio = MockDio();
    dioClient = FakeDioClient(mockDio);
  });

  group('7B: AuthRepository', () {
    test('loginWithGoogle sends correct POST body', () async {
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: {'access_token': 'jwt-token', 'token_type': 'bearer'},
          ));

      final repo = AuthRepository(dioClient: dioClient);
      final result = await repo.loginWithGoogle('google-id-token');

      expect(result, isA<Success<TokenResponse>>());
      final success = result as Success<TokenResponse>;
      expect(success.data.accessToken, 'jwt-token');

      verify(() => mockDio.post(
            '/api/v1/auth/google',
            data: {'id_token': 'google-id-token'},
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).called(1);
    });

    test('loginWithGoogle returns failure on 401', () async {
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 401,
              data: {'detail': 'Invalid ID token'},
            ),
            type: DioExceptionType.badResponse,
          ));

      final repo = AuthRepository(dioClient: dioClient);
      final result = await repo.loginWithGoogle('bad-token');

      expect(result, isA<Failure<TokenResponse>>());
      final failure = result as Failure<TokenResponse>;
      expect(failure.exception, isA<UnauthorizedException>());
      expect(failure.exception.message, 'Invalid ID token');
    });
  });

  group('7B: AgentRepository', () {
    test('submitPickup sends correct payload', () async {
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 201,
            data: {
              'id': 'c-1',
              'challan_type': 'PICKUP',
              'challan_number': 'P-001',
              'hotel_id': 'h-1',
              'agent_id': 'a-1',
              'image_key': null,
              'entry_timestamp': '2026-04-04T10:00:00Z',
              'last_edited_at': null,
              'edited_by': null,
              'departments': [],
            },
          ));

      final repo = AgentRepository(dioClient: dioClient);
      final result = await repo.submitPickup(PickupSubmitRequest(
        challanNumber: 'P-001',
        hotelId: 'h-1',
        departments: [],
      ));

      expect(result, isA<Success<ChallanResponse>>());

      verify(() => mockDio.post(
            '/api/v1/challans/pickup',
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).called(1);
    });

    test('submitDelivery sends correct payload', () async {
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 201,
            data: {
              'id': 'c-2',
              'challan_type': 'DELIVERY',
              'challan_number': 'D-001',
              'hotel_id': 'h-1',
              'agent_id': 'a-1',
              'image_key': null,
              'entry_timestamp': '2026-04-04T10:00:00Z',
              'last_edited_at': null,
              'edited_by': null,
              'departments': [],
            },
          ));

      final repo = AgentRepository(dioClient: dioClient);
      final result = await repo.submitDelivery(DeliverySubmitRequest(
        challanNumber: 'D-001',
        hotelId: 'h-1',
        departments: [],
      ));

      expect(result, isA<Success<ChallanResponse>>());
      verify(() => mockDio.post('/api/v1/challans/delivery', data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).called(1);
    });

    test('editChallan sends PATCH', () async {
      when(() => mockDio.patch(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: {
              'id': 'c-1',
              'challan_type': 'PICKUP',
              'challan_number': 'P-001',
              'hotel_id': 'h-1',
              'agent_id': 'a-1',
              'image_key': null,
              'entry_timestamp': '2026-04-04T10:00:00Z',
              'last_edited_at': '2026-04-04T11:00:00Z',
              'edited_by': 'a-1',
              'departments': [],
            },
          ));

      final repo = AgentRepository(dioClient: dioClient);
      final result = await repo.editChallan('c-1', ChallanEditRequest(departments: []));

      expect(result, isA<Success<ChallanResponse>>());
      verify(() => mockDio.patch('/api/v1/challans/c-1', data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
      )).called(1);
    });

    test('getChallanHistory passes query params', () async {
      when(() => mockDio.get(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 200,
            data: {'total': 0, 'page': 1, 'page_size': 10, 'items': []},
          ));

      final repo = AgentRepository(dioClient: dioClient);
      await repo.getChallanHistory('h-1', challanType: 'PICKUP', page: 2);

      verify(() => mockDio.get(
            '/api/v1/challans/hotel/h-1',
            data: any(named: 'data'),
            queryParameters: {
              'page': 2,
              'page_size': 20,
              'challan_type': 'PICKUP',
            },
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).called(1);
    });

    test('409 conflict returns ConflictException', () async {
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 409,
              data: {'detail': "A pickup challan with number 'P-001' already exists"},
            ),
            type: DioExceptionType.badResponse,
          ));

      final repo = AgentRepository(dioClient: dioClient);
      final result = await repo.submitPickup(PickupSubmitRequest(
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

  group('7B: Error mapping', () {
    test('400 → ValidationException', () async {
      when(() => mockDio.post(any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onSendProgress: any(named: 'onSendProgress'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions(), statusCode: 400, data: {'detail': 'Bad request'}),
            type: DioExceptionType.badResponse,
          ));
      final repo = AuthRepository(dioClient: dioClient);
      final result = await repo.loginWithGoogle('x');
      expect((result as Failure).exception, isA<ValidationException>());
    });

    test('403 → ForbiddenException', () async {
      when(() => mockDio.get(any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions(), statusCode: 403, data: {'detail': 'Forbidden'}),
            type: DioExceptionType.badResponse,
          ));
      final repo = AgentRepository(dioClient: dioClient);
      final result = await repo.getFormSchema('h-1');
      expect((result as Failure).exception, isA<ForbiddenException>());
    });

    test('404 → NotFoundException', () async {
      when(() => mockDio.get(any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions(), statusCode: 404, data: {'detail': 'Not found'}),
            type: DioExceptionType.badResponse,
          ));
      final repo = AgentRepository(dioClient: dioClient);
      final result = await repo.getPendingDeliveries('non-existent');
      expect((result as Failure).exception, isA<NotFoundException>());
    });

    test('500 → ServerException', () async {
      when(() => mockDio.get(any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions(), statusCode: 500, data: {'detail': 'Internal error'}),
            type: DioExceptionType.badResponse,
          ));
      final repo = AgentRepository(dioClient: dioClient);
      final result = await repo.getFormSchema('h-1');
      expect((result as Failure).exception, isA<ServerException>());
    });
  });
}
