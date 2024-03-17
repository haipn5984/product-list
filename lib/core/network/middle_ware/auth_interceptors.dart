import 'package:dio/dio.dart';
import 'base_interceptors.dart';

class AuthInterceptor extends BaseInterceptors {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['authorization'] = '';
    return super.onRequest(options, handler);
  }
}
