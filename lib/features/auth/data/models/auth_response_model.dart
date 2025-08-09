import 'package:gram_connect/features/auth/data/models/user.dart';
import 'package:gram_connect/features/auth/domain/entities/user_entity.dart';

class AuthResponseModel {
  final String message;
  final String token;
  final UserModel user;

  AuthResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      message: json['message'],
      token: 'token',
      user: UserModel.fromJson(json['user']),
    );
  }

  UserEntity toUserEntity() {
    return UserEntity(user.id, user.email, token);
  }
}
