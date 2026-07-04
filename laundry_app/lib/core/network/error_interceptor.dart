import 'dart:io';
import 'package:dio/dio.dart';
import 'api_result.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final AppException appException;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.error is SocketException) {
      appException = const NetworkException();
    } else if (err.response != null) {
      final statusCode = err.response!.statusCode;
      final detail = _extractDetail(err.response!.data);

      appException = switch (statusCode) {
        401 => UnauthorizedException(detail),
        403 => ForbiddenException(detail),
        400 => ValidationException(detail),
        404 => NotFoundException(detail),
        409 => ConflictException(detail),
        _ => ServerException(detail),
      };
    } else {
      appException = NetworkException(err.message ?? 'Unknown network error');
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: appException,
        response: err.response,
        type: err.type,
      ),
    );
  }

  String _extractDetail(dynamic data) {
    if (data is Map<String, dynamic> && data.containsKey('detail')) {
      final detail = data['detail'];
      if (detail is String) return detail;
      if (detail is List && detail.isNotEmpty) {
        return detail.map((e) => e['msg'] ?? e.toString()).join('; ');
      }
      return detail.toString();
    }
    if (data is String && data.isNotEmpty) return data;
    return 'An unexpected error occurred';
  }
}
