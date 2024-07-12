part of 'api_error_handler.dart';

// DO NOT edit enum DataSource values without synchronizing data errorsData
enum DataSource {
  noContent,
  badRequest,
  unAuthorized,
  forbidden,
  internalServerError,
  notFound,

  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,

  // API_LOGIC_ERROR,
  defaultError
}

ApiErrorModel _getErrorModel(DataSource dataSource) {
  switch (dataSource) {
    case DataSource.noContent:
      return const ApiErrorModel(code: 201, message: 'No Content');
    case DataSource.badRequest:
      return const ApiErrorModel(code: 400, message: 'Bad Request');
    case DataSource.unAuthorized:
      return const ApiErrorModel(code: 401, message: 'UnAuthorized');
    case DataSource.forbidden:
      return const ApiErrorModel(code: 403, message: 'Forbidden');
    case DataSource.notFound:
      return const ApiErrorModel(code: 404, message: 'Not Found');
    case DataSource.internalServerError:
      return const ApiErrorModel(code: 500, message: 'Internal Server Error');

    case DataSource.connectionTimeout:
      return const ApiErrorModel(code: -1, message: 'Connection Timeout');
    case DataSource.cancel:
      return const ApiErrorModel(code: -2, message: 'Cancel');
    case DataSource.receiveTimeout:
      return const ApiErrorModel(code: -3, message: 'Recieve Timeout');
    case DataSource.sendTimeout:
      return const ApiErrorModel(code: -4, message: 'Send Timeout');
    case DataSource.cacheError:
      return const ApiErrorModel(code: -5, message: 'Cache Error');
    case DataSource.noInternetConnection:
      return const ApiErrorModel(code: -6, message: 'No Internet Connection');

    case DataSource.defaultError:
    default:
      return const ApiErrorModel(code: -7, message: 'Default Error');
  }
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() => _getErrorModel(this);
}
