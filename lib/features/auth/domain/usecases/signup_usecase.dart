import 'package:gram_connect/core/usecases/usecase.dart';
import 'package:gram_connect/features/auth/domain/entities/user_entity.dart';
import 'package:gram_connect/features/auth/domain/repositories/auth_repositories.dart';
import 'package:gram_connect/features/auth/domain/usecases/params/auth_params.dart';

class SignupUsecase extends Usecase<UserEntity, AuthParams> {
  final AuthRepositories _authRepositories;

  SignupUsecase({required AuthRepositories authRepositories})
    : _authRepositories = authRepositories;
  @override
  Future<UserEntity> call(AuthParams params) {
    return _authRepositories.signup(params.email, params.password);
  }
}
