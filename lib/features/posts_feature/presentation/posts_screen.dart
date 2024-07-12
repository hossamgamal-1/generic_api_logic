import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api_logic/api_cubit.dart';
import '../../../core/di.dart';
import '../data/models/post_model.dart';
import '../logic/posts_cubit.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<PostsCubit>(),
      child: const _PostsScreenBody(),
    );
  }
}

class _PostsScreenBody extends StatelessWidget {
  const _PostsScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ApiBlocBuilder<PostsCubit, List<PostModel>>(
          apiCall: context.read<PostsCubit>().getPosts,
          successWidget: (posts) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    posts[index].title,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    posts[index].body,
                    maxLines: 1,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
