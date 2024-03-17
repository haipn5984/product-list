import 'package:dio/dio.dart';

import '../network_checker.dart';
import 'base_interceptors.dart';

class ConnectivityInterceptor extends BaseInterceptors {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await CheckerNetwork.checkNetwork();
    if (!connectivityResult) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
        ),
      );
    }
    return super.onRequest(options, handler);
  }
}
