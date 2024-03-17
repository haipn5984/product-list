import 'app_exception.dart';

class RouterException extends AppException {
  RouterException({
    this.overrideMessage,
  }) : super(AppExceptionType.remote);

  final String? overrideMessage;

  @override
  String get message {
    return overrideMessage ?? '';
  }
}
