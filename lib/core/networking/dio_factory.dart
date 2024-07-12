import 'package:dio/dio.dart';

import 'api_constants.dart';

class DioFactory {
  const DioFactory._();
  static Dio? _dio;

  static Dio get instance {
    if (_dio != null) return _dio!;

    const timeOut = Duration(seconds: ApiConstants.timeOut);
    _dio = Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    return _dio!;
  }
}
