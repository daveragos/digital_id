import 'package:digital_id/domain/entities/user.dart';

abstract class UserRepo {
  Future<List<User>> getUser();
  Future<User> login(String email, String password);
}
