import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../storage/secure_storage.dart';
import 'api_result.dart';
import 'auth_interceptor.dart';
import 'error_interceptor.dart';
import 'logging_interceptor.dart';

class DioClient {
  DioClient({
    required String baseUrl,
    required SecureStorage secureStorage,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    _dio.interceptors.addAll([
      AuthInterceptor(secureStorage),
      ErrorInterceptor(),
      if (kDebugMode) LoggingInterceptor(),
    ]);
  }

  final Dio _dio;

  Dio get dio => _dio;

  Future<ApiResult<T>> request<T>(
    Future<Response<dynamic>> Function(Dio dio) request,
    T Function(dynamic data) parser,
  ) async {
    try {
      final response = await request(_dio);
      return Success(parser(response.data));
    } on DioException catch (e, st) {
      if (e.error is AppException) {
        return Failure(e.error as AppException, st);
      }
      return Failure(const NetworkException(), st);
    } catch (e, st) {
      return Failure(ServerException(e.toString()), st);
    }
  }

  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) parser,
  }) {
    return request(
      (dio) => dio.get(path, queryParameters: queryParameters),
      parser,
    );
  }

  Future<ApiResult<T>> post<T>(
    String path, {
    dynamic data,
    required T Function(dynamic data) parser,
  }) {
    return request(
      (dio) => dio.post(path, data: data),
      parser,
    );
  }

  Future<ApiResult<T>> patch<T>(
    String path, {
    dynamic data,
    required T Function(dynamic data) parser,
  }) {
    return request(
      (dio) => dio.patch(path, data: data),
      parser,
    );
  }

  Future<ApiResult<T>> put<T>(
    String path, {
    dynamic data,
    required T Function(dynamic data) parser,
  }) {
    return request(
      (dio) => dio.put(path, data: data),
      parser,
    );
  }

  Future<ApiResult<T>> delete<T>(
    String path, {
    required T Function(dynamic data) parser,
  }) {
    return request(
      (dio) => dio.delete(path),
      parser,
    );
  }
}
