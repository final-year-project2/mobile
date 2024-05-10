import 'package:dio/dio.dart';

const BASE_URL = 'http://192.168.137.181:8000/';

class HttpServices {
  Dio dio = Dio();

  HttpServices() {
    init();
  }

  void init() {
    dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      // Uncomment and set headers if needed, e.g., for authentication
      // headers: {"Authorization": "Bearer $API_KEY"},
    ));
  }

  Future<Response> postRequest(String url, dynamic data) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          contentType: Headers
              .formUrlEncodedContentType, // Use formUrlEncodedContentType for form data
        ),
      );
      return response;
    } on DioError catch (e) {
      print('Error on post method: $e');
      throw Exception(e.message); // You can customize error handling as needed
    }
  }

  Future<Response> getRequest(String url, {dynamic data}) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: data, // Use queryParameters for GET requests
      );
      return response;
    } on DioError catch (e) {
      print('Error on get method: $e');
      throw Exception(e.message);
    }
  }

  Future<Response> patchRequest(String url, dynamic data) async {
    try {
      final response = await dio.patch(
        url,
        data: data,
        options: Options(),
      );
      return response;
    } on DioError catch (e) {
      print('Error on patch method: $e');
      throw Exception(e.message);
    }
  }
}
