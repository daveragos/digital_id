import 'package:digital_id/data/model/user_model.dart';
import 'package:digital_id/data/sources/api/api.dart';
import 'package:digital_id/data/sources/local/user_localdb.dart';
import 'package:digital_id/domain/entities/user.dart';
import 'package:digital_id/domain/repositories/user_repo.dart';
import 'package:dio/dio.dart';

class UserRepoImpl extends UserRepo {
  UserRepoImpl(this.userLocalDB, this.api);
  final UserLocalDB userLocalDB;
  final Api api;

  @override
  Future<List<User>> getUser() async {
    final userModels = await userLocalDB.read();
    return userModels!.map((userModel) => userModel.toEntity()).toList();
  }

  @override
  Future<User> login(String email, String password) async {
    final response = await api.login(email, password);
    if (response.statusCode == 200) {
      final userModel = UserModel.fromJson(response.data);
      return userModel.toEntity();
    } else {
      throw Exception('Failed to login');
    }
  }
}
