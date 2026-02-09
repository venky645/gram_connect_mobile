import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gram_connect/ui_handler/bloc/ui_handler_event.dart';
import 'package:gram_connect/ui_handler/bloc/ui_handler_state.dart';

class UiHandlerBloc extends Bloc<UiHandlerEvent, UiHandlerState> {
  UiHandlerBloc() : super(UiHandlerBlocIntialState()) {
    on<GoToHomePageEvent>(_navigateToHome);
  }

  FutureOr<void> _navigateToHome(
    GoToHomePageEvent event,
    Emitter<UiHandlerState> emit,
  ) {
    emit(GoToHomePageState());
  }
}
