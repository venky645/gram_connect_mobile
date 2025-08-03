import 'package:gram_connect/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? msg;

  UserModel({
    required String id,
    required String email,
    required String token,
    this.msg,
  }) : super(id, email, token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': {'id': id, 'email': email},
    };
  }

  UserEntity toUserEntity() {
    return UserEntity(id, email, token);
  }
}
