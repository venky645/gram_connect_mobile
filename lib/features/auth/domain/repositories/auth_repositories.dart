import 'package:gram_connect/features/auth/domain/entities/user_entity.dart'
    show UserEntity;

abstract class AuthRepositories {
  Future<UserEntity> login(String email, String password);
  // signUp();
}
