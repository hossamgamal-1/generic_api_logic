import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'api_constants.dart';

class DioFactory {
  const DioFactory._();
  static Dio? _dio;
  static const _timeOut = Duration(seconds: ApiConstants.timeOut);

  static Dio get instance {
    if (_dio != null) return _dio!;

    _dio = Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = _timeOut
      ..options.receiveTimeout = _timeOut
      ..interceptors.addAll([
        LogInterceptor(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
        DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(),
            allowPostMethod: true,
            policy: CachePolicy.request,
          ),
        ),
      ]);
    return _dio!;
  }
}
