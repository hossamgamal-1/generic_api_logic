import '../../../core/common_api_logic/api_cubit.dart';
import '../../../core/networking/result_or_failure.dart';

import '../data/repo/login_repo.dart';

class LoginCubit extends ApiCubit<void> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo);

  login() async {
    emit(ApiLoadingState());
    final result = await _loginRepo.login();

    switch (result) {
      case SuccessResult():
        emit(ApiSuccessState(null));
      case FailureResult():
        emit(ApiFailureState(result.errorHandler));
    }
  }
}
