import 'package:dio/dio.dart';

import 'app_exception.dart';
import 'remote_exception.dart';

class ExceptionHandler {
  static AppException catchingRemoteExeption(Object excetion) {
    if (excetion is DioException) {
      return excetion.mapToAppExcetion();
    }
    return UnCatchException();
  }
}

extension ExceptionMapper on DioException {
  AppException mapToAppExcetion() {
    if (response == null) {
      return RemoteException(
        kind: type.toRemoteKind,
        overrideMessage: message,
      );
    } else {
      if (response!.data is Map<String, dynamic>) {
        final json = response!.data as Map<String, dynamic>;
        json.addAll({'kind': type.toRemoteKind});
        return RemoteException.fromJson(json);
      } else {
        return RemoteException(
          httpCode: response!.statusCode ?? 0,
          kind: type.toRemoteKind,
          overrideMessage: response!.statusMessage,
        );
      }
    }
  }
}
