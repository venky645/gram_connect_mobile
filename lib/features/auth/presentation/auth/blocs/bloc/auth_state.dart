abstract class AuthState {}

class LoginInitState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String email;
  final String id;

  LoginSuccessState({required this.email, required this.id});
}

class LoginFailureState extends AuthState {
  final String error;

  LoginFailureState({required this.error});
}

class SignUpSuccessState extends AuthState {
  final String email;
  final String id;

  SignUpSuccessState({required this.email, required this.id});
}
