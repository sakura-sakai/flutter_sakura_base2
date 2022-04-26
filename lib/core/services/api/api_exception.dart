part of api_service;

class ApiException implements Exception {
  ApiException(this.code, this.message);

  ApiException.withInner(
    this.code, [
    this.message,
    this.innerException,
    this.stackTrace,
  ]);

  int code = -1;
  String? message;
  Exception? innerException;
  StackTrace? stackTrace;

  @override
  String toString() {
    if (message == null) {
      return 'ApiException';
    }
    if (innerException == null) {
      return 'ApiException $code: $message';
    }
    // ignore: lines_longer_than_80_chars
    return 'ApiException $code: $message (Inner exception: $innerException)\n\n${stackTrace?.toString() ?? ''}';
  }
}
