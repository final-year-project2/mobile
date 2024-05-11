import 'package:dio/dio.dart' as dio;
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class NewPasswordController extends GetxController {
  HttpServices? httpServices;
  dio.Dio _dio = dio.Dio();
  NewPasswordController() {
    httpServices = HttpServices();
    httpServices?.init();
  }

  Future<dio.Response> newPassword(
      String phoneNumber, String otp, String password) async {
    try {
      final response = await httpServices?.patchRequest(
          '/user/resetpassword/$phoneNumber/',
          {'password': password, 'otp': otp});
      if (response == null) {
        return throw Exception('null');
      }
      return response;
    } on dio.DioException catch (e) {
      print('error occured on new password method ${e.error}');
      print(
          'error occured on new password statuscode  ${e.response?.statusCode}');
      return throw Exception('error occred');
    }
  }
}
