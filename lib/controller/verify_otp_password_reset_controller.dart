import 'package:dio/dio.dart' as dio;
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class VerifyOtpPasswordResetController extends GetxController {
  HttpServices? httpServices;
  dio.Dio _dio = dio.Dio();
  RxString passwordOtp = ''.obs;

  VerifyOtpPasswordResetController() {
    httpServices = HttpServices();
    httpServices?.init();
  }

  Future<dio.Response> passwordResetOtpVerification(
      String otp, String phoneNumber) async {
    try {
      final respones = await httpServices?.getRequest(
          '/user/verifyVerification/$phoneNumber/',
          data: {'otp': otp});
      if (respones == null) {
        return throw Exception('password reset verification is null  ');
      }
      return respones;
    } on dio.DioException catch (e) {
      print('status code[otp-resetpassword]:${e.response?.statusCode}');
      print('error[otp-resetpassword]:${e.response?.statusMessage}');
      return throw Exception('ERROR occured $e');
    }
  }
}
