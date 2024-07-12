import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api_logic/api_cubit.dart';
import '../../../core/di.dart';
import '../../../core/extenstions.dart';
import '../logic/login_cubit.dart';
import 'landing_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const _HomeScreenBody(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.read<LoginCubit>().login(),
          child: ApiBlocListener<LoginCubit, void>(
            executeWhenSuccess: (context) {
              context.pushReplacement(widget: const LandingScreen());
            },
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}
