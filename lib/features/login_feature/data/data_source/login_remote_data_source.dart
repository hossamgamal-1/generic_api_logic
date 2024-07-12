import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';

class LoginRemoteDataSource {
  final ApiHelper _apiHelper;
  const LoginRemoteDataSource(this._apiHelper);

  Future<void> login() async {
    await _apiHelper.get(
      const ApiRequestModel(endPoint: ApiConstants.loginEP),
    );
  }
}
