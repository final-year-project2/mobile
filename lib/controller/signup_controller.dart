import 'package:dio/dio.dart' as dio;
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  var phoneNumber = '';
  var id = 0;

  dio.Dio _dio = dio.Dio();

  HttpServices? httpServices;
  SignUpController() {
    httpServices = HttpServices();
    // httpServices?.dioUnauthenticated;
    httpServices?.init();
  }

  Future<dio.Response> signUp(
      String name, String Phone_no, String password) async {
    // print('function started');
    isLoading.value = true;
    try {
      print('function started2');

      final response = await httpServices?.postRequest('user/create/', {
        'name': name,
        'Phone_no': Phone_no,
        'password': password,
        'otp': '',
      });
      if (response == null) {
        return throw Exception('response is null');
      }

      return response;
    } on dio.DioException catch (e) {
      print('error in signup$e');

      if (e.response?.statusCode == 400) {
        isLoading.value = false;

        final errorMessage = e.response?.data['detail'] ?? 'unknown error';
        final errorMessage2 = e.response?.data['Phone_no'] ?? 'unknown error';
        print('errorON:$errorMessage');
        print('errorON:$errorMessage2');
        print(e.response?.statusCode);
        throw Exception('error occured:${e.message}');
      } else {
        isLoading.value = false;
        throw Exception('error occured:${e.message}');
      }
    }
  }
}
