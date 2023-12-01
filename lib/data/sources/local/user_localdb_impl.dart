import 'package:digital_id/data/model/user_model.dart';
import 'package:digital_id/data/sources/local/user_localdb.dart';

class UserLocalDBImpl extends UserLocalDB {
  @override
  Future<List<UserModel>?> read() async {
    // return dummy data
    List<UserModel> dummy = [
      UserModel(
        id: 1,
        name: 'dave ragoose',
        email: 'email@gmail.com',
        address: 'here and there',
        role: 'freelance',
        phoneNumber: '09******',
      ),
      UserModel(
        id: 2,
        name: 'tige qufaa',
        email: 'tige@omi.joy',
        address: 'there',
        role: 'CEO',
        phoneNumber: '09******',
      ),
      UserModel(
        id: 3,
        name: 'ABDI waki',
        email: 'waki@omi.joy',
        address: 'just there',
        role: 'cto',
        phoneNumber: '09******',
      ),
      UserModel(
        id: 4,
        name: 'beki thin',
        email: 'beki@omi.joy',
        address: 'there i guess',
        role: 'idk really',
        phoneNumber: '09******',
      ),
      UserModel(
        id: 5,
        name: 'akram bdu',
        email: 'akram@omi.joy',
        address: 'here and there',
        role: 'teach',
        phoneNumber: '09******',
      ),
      UserModel(
        id: 6,
        name: 'some one',
        email: 'tige@omi.joy',
        address: 'here',
        role: 'freelance',
        phoneNumber: '09******',
      ),
      UserModel(
        id: 7,
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
