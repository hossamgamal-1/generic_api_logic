import 'api_error_handler.dart';

sealed class ResultOrFailure<T> {}

class SuccessResult<T> extends ResultOrFailure<T> {
  final T data;

  SuccessResult(this.data);
}

class FailureResult<T> extends ResultOrFailure<T> {
  final ErrorHandler errorHandler;

  FailureResult(dynamic error) : errorHandler = ErrorHandler(error);
}
