/// Base class for all application exceptions
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException(this.message, {this.code, this.originalError});

  @override
  String toString() => 'AppException: $message';
}

/// Network related exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, {super.code, super.originalError});
}

/// Authentication related exceptions
class AuthException extends AppException {
  const AuthException(super.message, {super.code, super.originalError});
}

/// Validation related exceptions
class ValidationException extends AppException {
  const ValidationException(super.message, {super.code, super.originalError});
}

/// Cache related exceptions
class CacheException extends AppException {
  const CacheException(super.message, {super.code, super.originalError});
}

/// Server related exceptions
class ServerException extends AppException {
  const ServerException(super.message, {super.code, super.originalError});
}

/// Unknown or unexpected exceptions
class UnknownException extends AppException {
  const UnknownException(super.message, {super.code, super.originalError});
}

/// Timer related exceptions
class TimerException extends AppException {
  const TimerException(super.message, {super.code, super.originalError});
}

/// Storage related exceptions
class StorageException extends AppException {
  const StorageException(super.message, {super.code, super.originalError});
}