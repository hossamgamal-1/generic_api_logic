import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_helper.dart';
import '../../../../core/networking/api_request_model.dart';
import '../models/post_model.dart';

class PostsRemoteDataSource {
  final ApiHelper _apiHelper;
  const PostsRemoteDataSource(this._apiHelper);

  Future<List<PostModel>> getPosts() async {
    final data = await _apiHelper.get(
      const ApiRequestModel(endPoint: ApiConstants.postsEP),
    );

    return (data as List).map((json) => PostModel.fromJson(json)).toList();
  }
}
