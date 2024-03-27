import 'package:dio/dio.dart';

// const BASE_URL = 'http://192.168.137.74:8000/';

const BASE_URL = 'http://10.0.2.2:8000/';

class HttpServices {
  Dio dio = Dio();
  Future<Response> postRequest(String url, dynamic data) async {
    final response;
    try {
      response = dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      print('Error on post method$e');
      throw Exception(e);
    }
  }

  void init() {
    dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
    ));
  }
  // Future<Response> getRequest(String url) async {
  //   final response;
  //   try {
  //     response = dio.get(url);
  //     return response;
  //   } on DioException catch (e) {
  //     print('Error on get method$e');
  //     throw Exception(e);
  //   }
  // }

  // final Dio dioUnauthenticated = Dio(BaseOptions(baseUrl: BASE_URL));

  // final Dio dioAuthenticated = Dio();

  //   void init() {
  //   dio = Dio(BaseOptions(
  //       baseUrl: BASE_URL, headers: {"Authorization": "Bearer $API_KEY"}));
  // }
}
