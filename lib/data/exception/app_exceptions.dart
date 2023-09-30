abstract class AppException implements Exception {
  String? _message;
  String? _prefix;

  AppException([this._prefix, this._message]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataExceptions extends AppException {
  FetchDataExceptions([String? message])
      : super(message, '');
}

class BadRequestExceptions extends AppException {
  BadRequestExceptions([String? message])
      : super(message, '');
}

class UnauthorizedExceptions extends AppException {
  UnauthorizedExceptions([String? message])
      : super(message, '');
}

class InvalidInputExceptions extends AppException {
  InvalidInputExceptions([String? message])
      : super(message, '');
}