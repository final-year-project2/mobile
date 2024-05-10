import "package:dio/dio.dart" as dio;
import "package:frontend/services/http_services.dart";
import "package:get/get.dart";
// import "package:get/get_rx/get_rx.dart";
// import "package:get/get_rx/src/rx_types/rx_types.dart";

class AskPhoneNumber extends GetxController {
  RxBool isLoading = false.obs;
  RxString phoneNumber = ''.obs;
  HttpServices? httpservice;
  dio.Dio _dio = dio.Dio();
  AskPhoneNumber() {
    httpservice = HttpServices();
    httpservice?.init();
  }

  Future<dio.Response> askPhoneNumberForPasswordReset(String Phone_no) async {
    try {
      isLoading = true.obs;
      final response =
          await httpservice?.getRequest('/user/getVerification/$Phone_no/');

      if (response == null) {
        isLoading = false.obs;
        return throw Exception('response is null');
      }

      return response;
    } on dio.DioException catch (e) {
      isLoading = false.obs;
      print(
          'error occured on asking phone number reset password :${e.message}');
      print('response code :${e.response?.statusCode}');
      return throw Exception(
          'Error occured @ accepting user phone number  for password reset ${e.message}');
    }
  }
}
