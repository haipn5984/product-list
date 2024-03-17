import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/app_constants.dart';
import 'middle_ware/auth_interceptors.dart';
import 'middle_ware/connect_interceptors.dart';
import 'middle_ware/header_interceptors.dart';
import 'middle_ware/logger_interceptors.dart';
import 'middle_ware/refresh_token_interceptors.dart';

Dio provideDio({bool refreshTokenInterceptors = true, String? baseURL}) {
  final options = BaseOptions(
    baseUrl: baseURL ?? (AppConstants.baseURL),
    receiveTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 8),
    followRedirects: false,
  );
  final dio = Dio(options);
  dio.transformer = BackgroundTransformer();
  dio.interceptors.addAll(
    [
      ConnectivityInterceptor(),
      HeaderInterceptors(),
      AuthInterceptor(),
      if (refreshTokenInterceptors) RefreshTokenInterceptors(),
      if (kDebugMode) CustomLogger(),
    ],
  );

  return dio;
}
