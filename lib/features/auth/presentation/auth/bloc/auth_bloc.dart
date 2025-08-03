import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gram_connect/features/auth/domain/usecases/login_usecase.dart';
import 'package:gram_connect/features/auth/domain/usecases/params/auth_params.dart';
import 'package:gram_connect/features/auth/presentation/auth/bloc/auth_event.dart';
import 'package:gram_connect/features/auth/presentation/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  AuthBloc(this._loginUsecase) : super(LoginInitState()) {
    on<LoginEvent>(_onLoginRequested);
    on<SignUpEvent>(_onSignUpRequest);
  }

  FutureOr<void> _onLoginRequested(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());
    try {
      final respose = await _loginUsecase.call(
        AuthParams(email: event.email, password: event.password),
      );

      emit(LoginSuccessState(email: respose.email, id: respose.id));
    } catch (e) {
      emit(LoginFailureState(error: e.toString()));
    }
  }

  FutureOr<void> _onSignUpRequest(SignUpEvent event, Emitter<AuthState> emit) {}
}
