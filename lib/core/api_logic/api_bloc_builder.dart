part of 'api_cubit.dart';

class ApiBlocBuilder<T extends Cubit<ApiState<L>>, L> extends StatelessWidget {
  final Function apiCall;
  final Widget? loadingWidget;
  final Widget Function(L) successWidget;
  final Widget? failureWidget;
  const ApiBlocBuilder({
    super.key,
    required this.apiCall,
    this.loadingWidget,
    required this.successWidget,
    this.failureWidget,
  });

  @override
  Widget build(BuildContext context) {
    apiCall();
    return BlocBuilder<T, ApiState<L>>(
      builder: (context, state) {
        switch (state) {
          case ApiInitialState():
          case ApiLoadingState():
            return loadingWidget ??
                const Center(child: CircularProgressIndicator());

          case ApiFailureState():
            return failureWidget ??
                ExceptionWidget(state.error, retryFunction: apiCall);

          case ApiSuccessState():
            return successWidget(state.data);
        }
      },
    );
  }
}
