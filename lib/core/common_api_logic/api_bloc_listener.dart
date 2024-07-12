part of 'api_cubit.dart';

class ApiBlocListener<T extends Cubit<ApiState<L>>, L> extends StatelessWidget {
  final T? bloc;
  final Function(BuildContext)? executeWhenLoading;
  final Function(BuildContext)? executeWhenFailure;
  final Function(BuildContext) executeWhenSuccess;
  final Widget? child;
  const ApiBlocListener({
    super.key,
    this.bloc,
    this.executeWhenLoading,
    this.executeWhenFailure,
    required this.executeWhenSuccess,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<T, ApiState<L>>(
      listener: (context, state) {
        switch (state) {
          case ApiLoadingState():
            executeWhenLoading ?? context.showLoadingAlertDialog();

          case ApiFailureState():
            context.pop();
            executeWhenFailure ??
                context.showErrorSnackBar(content: state.error);

          case ApiSuccessState():
            context.pop();
            executeWhenSuccess(context);

          default:
            context.pop();
        }
      },
      child: child,
    );
  }
}
