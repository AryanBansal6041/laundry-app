sealed class ApiResult<T> {
  const ApiResult();
}

final class Success<T> extends ApiResult<T> {
  const Success(this.data);
  final T data;
}

final class Failure<T> extends ApiResult<T> {
  const Failure(this.exception, [this.stackTrace]);
  final AppException exception;
  final StackTrace? stackTrace;
}

sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Unauthorized']);
}

class ForbiddenException extends AppException {
  const ForbiddenException([super.message = 'Forbidden']);
}

class ValidationException extends AppException {
  const ValidationException([super.message = 'Validation error']);
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Not found']);
}

class ConflictException extends AppException {
  const ConflictException([super.message = 'Conflict']);
}

class ServerException extends AppException {
  const ServerException([super.message = 'Internal server error']);
}

class NetworkException extends AppException {
  const NetworkException(
      [super.message = 'No internet connection or request timed out']);
}
