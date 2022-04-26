part of exceptions;

///
/// [GenericException]is a generic exception
///
class GenericException implements Exception {
  final ExceptionType code;
  final String message;
  final Exception? innerException;
  final StackTrace? stackTrace;

  const GenericException({
    this.code = ExceptionType.warn,
    required this.message,
  })  : innerException = null,
        stackTrace = null;

  const GenericException.withInner({
    this.code = ExceptionType.warn,
    required this.message,
    this.innerException,
    this.stackTrace,
  });

  @override
  String toString() {
    if (innerException == null) {
      return 'GenericException $code: $message';
    }

    return 'GenericException $code: '
            '$message (Inner exception: $innerException)\n\n' +
        stackTrace.toString();
  }

  factory GenericException.handler(dynamic e) {
    String? _message;
    ExceptionType _code;

    // ApiException
    if (e is ApiException) {
      switch (e.code) {

        /// HTTP 400
        case HttpStatus.badRequest:
          _code = ExceptionType.fatal;
          _message = e.message;
          break;

        /// HTTP 401
        case HttpStatus.unauthorized:
          _code = ExceptionType.unauthorizedError;
          _message = e.message;
          break;

        /// HTTP 403
        case HttpStatus.forbidden:
          _code = ExceptionType.forbidden;
          _message = e.message;
          break;

        /// HTTP 404
        case HttpStatus.notFound:
          _code = ExceptionType.notFoundError;
          _message = e.message;
          break;

        /// HTTP 422
        case HttpStatus.unprocessableEntity:
          _code = ExceptionType.validationError;
          _message = e.message;
          break;

        /// HTTP 426
        case HttpStatus.upgradeRequired:
          _code = ExceptionType.forcedUpdate;
          _message = 'Forced version upgrade is required';
          break;

        default:
          _code = ExceptionType.serverError;
          _message = e.code.toString();
      }
    }

    // SocketException
    else if (e is SocketException) {
      _code = ExceptionType.serverError;
      _message = e.message;
    }

    // PlatformException
    else if (e is PlatformException) {
      _code = ExceptionType.fatal;
      _message = e.message;
    }

    // MissingPluginException
    else if (e is MissingPluginException) {
      _code = ExceptionType.fatal;
      _message = e.message;
    }

    // TimeoutException
    else if (e is TimeoutException) {
      _code = ExceptionType.serverError;
      _message = e.message;
    }

    // GenericException
    else if (e is GenericException) {
      _code = e.code;
      _message = e.message;
    }

    // SecureStorageException
    else if (e is SecureStorageException) {
      _code = ExceptionType.fatal;
      _message = e.message;
    }

    // Other
    else {
      _code = ExceptionType.fatal;
      _message = e.toString();
    }

    return GenericException(
      message: _message ?? 'GenericException',
      code: _code,
    );
  }
}

class UnauthorizedException extends GenericException {
  const UnauthorizedException(
    String message, {
    ExceptionType code = ExceptionType.unauthorizedError,
  }) : super(code: code, message: message);
}

class FatalException extends GenericException {
  FatalException(
    String target, {
    ExceptionType code = ExceptionType.fatal,
  })  : assert(target.isNotEmpty),
        super(code: code, message: '$target does not exist.');
}

class NotFoundException extends GenericException {
  NotFoundException(
    String target, {
    ExceptionType code = ExceptionType.alert,
  })  : assert(target.isNotEmpty),
        super(code: code, message: '$target could not be found.');
}

class NotUniqueException extends GenericException {
  NotUniqueException(
    String value, {
    ExceptionType code = ExceptionType.validationError,
  })  : assert(value.isNotEmpty),
        super(code: code, message: '$value is duplicated.');
}

class NullEmptyException extends GenericException {
  const NullEmptyException(
    String value, {
    ExceptionType code = ExceptionType.validationError,
  }) : super(code: code, message: '$value is required.');
}

class LengthException extends GenericException {
  const LengthException(
    String value,
    int max, {
    ExceptionType code = ExceptionType.validationError,
  })  : assert(max > 0),
        super(code: code, message: 'The maximum value of $value is $max.');
}

class RemovalException extends GenericException {
  const RemovalException(
    String value, {
    ExceptionType code = ExceptionType.alert,
  }) : super(code: code, message: '$value could not be deleted.');
}

class ValidationException extends GenericException {
  const ValidationException(
    String value, {
    ExceptionType code = ExceptionType.alert,
  }) : super(code: code, message: '$value is an invalid input value.');
}
