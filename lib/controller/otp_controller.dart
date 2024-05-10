import 'package:dio/dio.dart';
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class OTPController extends GetxController {
  dio.Dio _dio = dio.Dio();

  HttpServices? httpServices;
  OTPController() {
    httpServices = HttpServices();
    httpServices?.init();
  }

  Future<dio.Response> verifOtp(int id, String otp) async {
    try {
      final response = await httpServices?.patchRequest('/user/activate/$id/', {
        'otp': otp,
      });
      if (response == null) {
        return throw Exception('response is null');
      }
      return response;
    } on DioException catch (e) {
      print('SMSstatuscode${e.response?.statusCode}');
      return throw Exception('error occured in $e');
    }
  }
}
