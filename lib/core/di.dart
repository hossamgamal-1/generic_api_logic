import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/login_feature/data/data_source/login_remote_data_source.dart';
import '../features/login_feature/data/repo/login_repo.dart';
import '../features/login_feature/logic/login_cubit.dart';
import '../features/posts_feature/data/data_source/posts_remote_data_source.dart';
import '../features/posts_feature/data/repo/posts_repo.dart';
import '../features/posts_feature/logic/posts_cubit.dart';
import 'networking/api_helper.dart';
import 'networking/dio_factory.dart';

final GetIt getIt = GetIt.instance;

initGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioFactory.instance);
  getIt.registerLazySingleton<ApiHelper>(() => DioHelper(getIt()));

  getIt.registerLazySingleton(() => LoginRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => LoginRepo(getIt()));
  getIt.registerLazySingleton(() => LoginCubit(getIt()));

  getIt.registerLazySingleton(() => PostsRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => PostsRepo(getIt()));
  getIt.registerLazySingleton(() => PostsCubit(getIt()));
}
