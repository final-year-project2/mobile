import 'package:dio/dio.dart' as dio;
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool startRequest = false.obs;

  dio.Dio _dio = dio.Dio();

  HttpServices? httpServices;
  SignUpController() {
    httpServices = HttpServices();
    // httpServices?.dioUnauthenticated;
    httpServices?.init();
  }

  Future signUp(String name, String password, String Phone_no) async {
    // print('function started');
    try {
      print('function started2');
      startRequest = true.obs;
      final response = await httpServices?.postRequest('user/create/', {
        'name': name,
        'Phone_no': Phone_no,
        'password': password,
      });
      if (response == null) {
        return throw Exception('response is null');
      }

      return response.statusCode;
    } on dio.DioException catch (e) {
      print('error in signup$e');

      if (e.response?.statusCode == 400) {
        final errorMessage = e.response?.data['Email'] ?? 'unknown error';
        final errorMessage2 = e.response?.data['Phone_no'] ?? 'unknown error';
        print('errorON:$errorMessage');
        print('errorON:$errorMessage2');
        print(e.response?.statusCode);
        throw Exception('error occured:${e.message}');
      } else {
        throw Exception('error occured:${e.message}');
      }
    }
  }
}
