import 'package:digital_id/app/constants/api_const.dart';
import 'package:dio/dio.dart';

class Api {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConst.api,
  ));

  Future<Response> login(String email, String password) async {
    return await dio.post(
      ApiConst.login,
      data: {
        'email': email,
        'password': password,
      },
    );
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
