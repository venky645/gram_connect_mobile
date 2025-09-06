import 'package:dio/dio.dart';
import 'package:gram_connect/core/network/api_constants.dart';
import 'package:gram_connect/features/auth/data/models/auth_response_model.dart';
import 'package:gram_connect/features/auth/domain/entities/user_entity.dart';
import 'package:gram_connect/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepostoryImpl implements AuthRepositories {
  final Dio dio;
  AuthRepostoryImpl(this.dio);

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );

      final authresponseModel = AuthResponseModel.fromJson(response.data);
      return authresponseModel.toUserEntity();
    } on Dio catch (e) {
      throw Exception('login failed: ${e.toString()}');
    }
  }

  @override
  Future<UserEntity> signup(String email, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.signUP,
        data: {'email': email, 'password': password},
      );

      final authresponseModel = AuthResponseModel.fromJson(response.data);
      return authresponseModel.toUserEntity();
    } on Dio catch (e) {
      throw Exception('signup failed: ${e.toString()}');
    }
  }
}
