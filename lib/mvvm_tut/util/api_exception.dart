class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix : $_message}';
  }
}

class BadRequestException extends ApiException {
  BadRequestException([String? message]) : super(message, "Invalid request");
}

class UnknownException extends ApiException {
  UnknownException([String? message]) : super(message, "Unknown exception");
}
