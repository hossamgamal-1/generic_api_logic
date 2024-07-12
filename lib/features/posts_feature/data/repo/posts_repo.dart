import '../../../../core/networking/result_or_failure.dart';
import '../data_source/posts_remote_data_source.dart';
import '../models/post_model.dart';

class PostsRepo {
  final PostsRemoteDataSource _remoteDataSource;
  const PostsRepo(this._remoteDataSource);

  Future<ResultOrFailure<List<PostModel>>> getPosts() async {
    try {
      final posts = await _remoteDataSource.getPosts();
      return SuccessResult(posts);
    } catch (error) {
      return FailureResult(error);
    }
  }
}
