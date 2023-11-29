import 'package:digital_id/data/model/user_model.dart';
import 'package:digital_id/data/sources/local/user_localdb.dart';

class UserLocalDBImpl extends UserLocalDB {
  @override
  Future<List<UserModel>?> read() async {
    // return dummy data
    List<UserModel> dummy = [
      UserModel(
        name: 'dave ragoose',
        email: 'email@gmail.com',
        address: 'here and there',
        role: 'freelance',
        phoneNumber: '09******',
      ),
      UserModel(
        name: 'tige qufaa',
        email: 'tige@omi.joy',
        address: 'there',
        role: 'CEO',
        phoneNumber: '09******',
      ),
      UserModel(
        name: 'ABDI waki',
        email: 'waki@omi.joy',
        address: 'just there',
        role: 'cto',
        phoneNumber: '09******',
      ),
      UserModel(
        name: 'beki thin',
        email: 'beki@omi.joy',
        address: 'there i guess',
        role: 'idk really',
        phoneNumber: '09******',
      ),
      UserModel(
        name: 'akram bdu',
        email: 'akram@omi.joy',
        address: 'here and there',
        role: 'teach',
        phoneNumber: '09******',
      ),
      UserModel(
        name: 'some one',
        email: 'tige@omi.joy',
        address: 'here',
        role: 'freelance',
        phoneNumber: '09******',
      ),
      UserModel(
        name: 'dave ragoose',
        email: 'tige@omi.joy',
        address: 'there',
        role: 'dev',
        phoneNumber: '09******',
      ),
    ];
    return dummy;
  }
}
