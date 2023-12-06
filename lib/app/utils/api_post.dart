// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:digital_id/app/constants/api_const.dart';
import 'package:digital_id/app/utils/alert_dialog.dart' as alert;
import 'package:digital_id/app/utils/api_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIPost {
  alert.AlerterDialog alertDialog = alert.AlerterDialog();
  postRequest(
      {required String route,
      required Map<String, String> data,
      required BuildContext context}) async {
    //use dio package
    final dio = Dio();
    //handle all errors that could occur using try catch
    try {
      final response = await dio.post(ApiConst.api + route, data: data);
      print('should expect : ${response.statusCode}');
      return response;
    } on DioException catch (e) {
      checkException(e, context);
    } catch (e) {
      alertDialog.showAlert(
          context: context, title: 'Error', content: e.toString());
    }
  }

  void checkException(DioException error, BuildContext context) {
    APIException exception = APIException();
    final List<String> message = exception.getExceptionMessage(error);
    alertDialog.showAlert(
      context: context,
      title: message[0],
      content: message[1],
    );
  }
}
