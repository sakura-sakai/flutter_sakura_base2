///
/// Secure storage error definition
///
part of secure_storage;

class SecureStorageException implements Exception {
  SecureStorageException(this.message);

  SecureStorageException.withInner(
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
    if (message == null) return "SecureStorageException";

    if (innerException == null) {
      return 'SecureStorageException $code: $message';
    }

    // ignore: lines_longer_than_80_chars
    return 'SecureStorageException $code: $message (Inner exception: $innerException)\n\n${stackTrace?.toString() ?? ''}';
  }
}
