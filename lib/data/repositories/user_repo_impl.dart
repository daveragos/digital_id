import 'package:digital_id/data/sources/local/user_localdb.dart';
import 'package:digital_id/domain/entities/user.dart';
import 'package:digital_id/domain/repositories/user_repo.dart';

class UserRepoImpl extends UserRepo {
  UserRepoImpl(this.userLocalDB);
  final UserLocalDB userLocalDB;

  @override
  Future<List<User>> getUser() async {
    final userModels = await userLocalDB.read();
    return userModels!.map((userModel) => userModel.toEntity()).toList();
  }
}
