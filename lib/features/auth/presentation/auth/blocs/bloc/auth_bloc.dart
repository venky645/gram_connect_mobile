import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gram_connect/features/auth/domain/usecases/login_usecase.dart';
import 'package:gram_connect/features/auth/domain/usecases/params/auth_params.dart';
import 'package:gram_connect/features/auth/domain/usecases/save_token_use_case.dart';
import 'package:gram_connect/features/auth/domain/usecases/signup_usecase.dart';
import 'package:gram_connect/features/auth/presentation/auth/blocs/bloc/auth_event.dart';
import 'package:gram_connect/features/auth/presentation/auth/blocs/bloc/auth_state.dart';
import 'package:gram_connect/ui_handler/bloc/ui_handler_bloc.dart';
import 'package:gram_connect/ui_handler/bloc/ui_handler_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final SignupUsecase _signupUsecase;
  final SaveTokenUseCase _saveTokenUseCase;

  final UiHandlerBloc _uiHandlerBloc;

  AuthBloc(
    this._loginUsecase,
    this._saveTokenUseCase,
    this._uiHandlerBloc,
    this._signupUsecase,
  ) : super(LoginInitState()) {
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
        AuthParams(
          email: event.authParams.email,
          password: event.authParams.password,
        ),
      );

      if (respose.email.isNotEmpty &&
          respose.id.isNotEmpty &&
          respose.token.isNotEmpty) {
        print('success');
        _saveTokenUseCase.call(respose.token);

        _uiHandlerBloc.add(GoToHomePageEvent());

        
      }
    } catch (e) {
      print('failure....');
      emit(LoginFailureState(error: e.toString()));
    }
  }

  FutureOr<void> _onSignUpRequest(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());
    try {
      final respose = await _signupUsecase.call(
        AuthParams(
          email: event.authParams.email,
          password: event.authParams.password,
        ),
      );

      if (respose.email.isNotEmpty &&
          respose.id.isNotEmpty &&
          respose.token.isNotEmpty) {
        print('success');
        _saveTokenUseCase.call(respose.token);

        _uiHandlerBloc.add(GoToHomePageEvent());

        emit(SignUpSuccessState(email: respose.email, id: respose.id));
      }
    } catch (e) {
      print('failure....');
      emit(LoginFailureState(error: e.toString()));
    }
  }
}
