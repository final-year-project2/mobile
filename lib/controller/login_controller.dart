import 'package:dio/dio.dart' as dio;
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  HttpServices? httpServices;
  RxBool isLoading = false.obs;
  LoginController() {
    httpServices = HttpServices();
    httpServices?.init();
  }
  dio.Dio _dio = dio.Dio();
  RxBool isPasswordVissible = true.obs;
  RxBool itIsNotPassword = false.obs;
  void TogglePasswordVissiblity() {
    print('toggle called');
    isPasswordVissible.toggle();
  }

  Future<dio.Response> loginRequest(String Phone_no, String password) async {
    isLoading.value = true;
    try {
      final response = await httpServices?.postRequest(
          '/user/login/', {'Phone_no': Phone_no, 'password': password});

      if (response == null) {
        return throw Exception('login response is null');
      }
      return response;
    } on dio.DioException catch (e) {
      print('LoginError:$e');
      print('LoginDetail${e.response?.data['detail']}');
      print('LoginStatuscode:${e.response?.statusCode}');
      throw Exception(e);
    }
  }

  Future<dio.Response> postproduc(String Phone_no, String password) async {
    try {
      final response = await httpServices?.postRequest(
          '/user/login/', {'Phone_no': Phone_no, 'password': password});

      if (response == null) {
        return throw Exception('login response is null');
      }
      return response;
    } on dio.DioException catch (e) {
      print('LoginError:$e');
      print('LoginDetail${e.response?.data['detail']}');
      print('LoginStatuscode:${e.response?.statusCode}');
      throw Exception(e);
    }
  }
}
