import 'package:digital_id/data/model/user_model.dart';

abstract class UserLocalDB {
  Future<List<UserModel>?> read();
}
