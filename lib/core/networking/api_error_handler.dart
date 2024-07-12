import 'dart:developer';

import 'package:dio/dio.dart';

import 'api_error_model.dart';

part 'errors_data.dart';

class ErrorHandler {
  final ApiErrorModel apiErrorModel;
  ErrorHandler(dynamic error) : apiErrorModel = _handleError(error);

  static ApiErrorModel _handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioExceptions(error);
    }

    if (error is String) return ApiErrorModel(message: error);

    if (error is Exception) {
      // Exception are printed in this format "Exception : {errorMessage}"
      final errorMessage = error.toString().split(':').last;
      return ApiErrorModel(message: errorMessage);
    }

    return DataSource.defaultError.getFailure();
  }
}

ApiErrorModel _handleDioExceptions(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.cancel:
      return error.type.getFailure();

    case DioExceptionType.badResponse:
    case DioExceptionType.unknown:
      final response = error.response;

      final hasResponse = response != null;
      final hasStatusCode = response?.statusCode != null;
      final hasStatusMessage = response?.statusMessage != null;

      if (hasResponse &&
          response.data is Map &&
          hasStatusCode &&
          hasStatusMessage) {
        return ApiErrorModel.fromJson(response.data);
      }

      if (hasResponse && hasStatusCode) {
        ApiErrorModel? apiErrorModel;
        for (var dataSource in DataSource.values) {
          if (dataSource.getFailure().code == response.statusCode) {
            apiErrorModel = dataSource.getFailure();
          }
        }
        if (apiErrorModel != null) return apiErrorModel;
      }

      return DataSource.defaultError.getFailure();

    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

extension DioErrorExtension on DioExceptionType {
  ApiErrorModel getFailure() {
    try {
      final dataSource = DataSource.values.byName(name);
      return dataSource.getFailure();
    } catch (e) {
      log('$name is not a valid DataSource enum value.');
      return DataSource.defaultError.getFailure();
    }
  }
}
