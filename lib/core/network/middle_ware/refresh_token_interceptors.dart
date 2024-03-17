import 'dart:io';
import 'package:dio/dio.dart';

import 'base_interceptors.dart';

class RefreshTokenInterceptors extends BaseInterceptors {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final options = err.response!.requestOptions;
      _onExpiredToken(options, handler);
    } else {
      handler.next(err);
    }
  }

  void _onExpiredToken(
    RequestOptions options,
    ErrorInterceptorHandler handler,
  ) {}
}
