import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      dev.log(
        '→ ${options.method} ${options.uri}',
        name: 'HTTP',
      );
      if (options.data != null) {
        dev.log('  Body: ${options.data}', name: 'HTTP');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      dev.log(
        '← ${response.statusCode} ${response.requestOptions.uri}',
        name: 'HTTP',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      dev.log(
        '✖ ${err.response?.statusCode ?? 'N/A'} ${err.requestOptions.uri}',
        name: 'HTTP',
        error: err.message,
      );
    }
    handler.next(err);
  }
}
