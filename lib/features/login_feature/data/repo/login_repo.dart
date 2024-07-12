import '../../../../core/networking/result_or_failure.dart';
import '../data_source/login_remote_data_source.dart';

class LoginRepo {
  final LoginRemoteDataSource _remoteDataSource;
  const LoginRepo(this._remoteDataSource);

  Future<ResultOrFailure<void>> login() async {
    try {
      await _remoteDataSource.login();
      return SuccessResult(null);
    } catch (error) {
      return FailureResult(error);
    }
  }
}
