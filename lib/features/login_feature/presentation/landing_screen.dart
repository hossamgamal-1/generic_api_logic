import 'package:flutter/material.dart';

import '../../../core/extenstions.dart';
import '../../posts_feature/presentation/posts_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push(widget: const PostsScreen());
          },
          child: const Text('Go To Posts Screen'),
        ),
      ),
    );
  }
}
