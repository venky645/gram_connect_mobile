import 'package:gram_connect/features/auth/domain/usecases/params/auth_params.dart';

abstract class AuthEvent {}

class LoginInitEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final AuthParams authParams;

  LoginEvent(this.authParams);
}

class SignUpEvent extends AuthEvent {}
