abstract class AppException implements Exception {
  final AppExceptionType type;

  AppException(this.type);

  String get message;
}

class UnCatchException extends AppException {
  UnCatchException({this.overridMessage}) : super(AppExceptionType.unknown);
  final String? overridMessage;

  @override
  String get message {
    return overridMessage ?? 'Some things went wrong';
  }
}

enum AppExceptionType {
  remote,
  localData,
  unknown,
  router,
}
