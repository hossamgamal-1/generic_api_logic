part of 'api_cubit.dart';

sealed class ApiState<T> {}

class ApiInitialState<T> implements ApiState<T> {}

class ApiLoadingState<T> implements ApiState<T> {}

class ApiSuccessState<T> implements ApiState<T> {
  final T data;
  ApiSuccessState(this.data);
}

class ApiFailureState<T> implements ApiState<T> {
  final String error;
  ApiFailureState(ErrorHandler handler) : error = handler.apiErrorModel.message;
}
