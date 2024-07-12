import '../../../core/api_logic/api_cubit.dart';
import '../../../core/networking/result_or_failure.dart';
import '../data/models/post_model.dart';
import '../data/repo/posts_repo.dart';

class PostsCubit extends ApiCubit<List<PostModel>> {
  final PostsRepo _postsRepo;
  PostsCubit(this._postsRepo);

  Future<void> getPosts() async {
    // if (state is ApiSuccessState) {
    //   return emit(state);
    // }

    emit(ApiLoadingState());
    final result = await _postsRepo.getPosts();

    switch (result) {
      case SuccessResult():
        emit(ApiSuccessState(result.data));

      case FailureResult():
        emit(ApiFailureState(result.errorHandler));
    }
  }
}
