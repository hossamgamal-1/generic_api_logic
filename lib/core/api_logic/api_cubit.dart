import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../extenstions.dart';
import '../networking/api_error_handler.dart';
import '../widgets/exception_widget.dart';

part 'api_bloc_builder.dart';
part 'api_bloc_listener.dart';
part 'api_states.dart';

abstract class ApiCubit<T> extends Cubit<ApiState<T>> {
  ApiCubit() : super(ApiInitialState());
}
