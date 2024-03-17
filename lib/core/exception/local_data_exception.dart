import 'app_exception.dart';

class LocalDataException extends AppException {
  LocalDataException({
    required this.key,
    this.overrideMessage,
  }) : super(AppExceptionType.localData);

  final String key;

  final String? overrideMessage;

  @override
  String get message {
    return overrideMessage ?? 'Unkown Error';
  }
}
