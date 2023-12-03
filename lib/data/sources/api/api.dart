import 'package:digital_id/app/constants/api_const.dart';
import 'package:dio/dio.dart';

class Api {
  Future<Response> login(String email, String password) async {
    final response = await Dio().post(
      ApiConst.api + ApiConst.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    print('RESPONSE ========== $response');
    return response;
  }
  // Future<Response> register(String name, String email, String password) async {
  //   return await dio.post(
  //     ApiConst.register,
  //     data: {
  //       'name': name,
  //       'email': email,
  //       'password': password,
  //     },
  //   );
  // }
}
