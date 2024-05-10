import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

const BASE_URL = 'http://192.168.137.181:8000/';

final tokenBox = GetStorage();

var accessToken = tokenBox.read('accessToken');
var refreshToken = tokenBox.read('refreshToken');

class HttpServices {
  Dio dio = Dio();


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


  Future<String> getNewAccessToken(String tokenRefresh) {
    final response;
    try {
      response = postRequest('/user/api/token/refresh/', tokenRefresh);

      return response;
    } on DioException catch (e) {
      print('Error on patch method$e');
      throw Exception(e);
    }
  }

  void init() {
    dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
    ));
  }

  void initAuthenticated() {
    dio.options.baseUrl = BASE_URL;
    dio.options.headers["Authorization"] = "Bearer $accessToken";

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = "Bearer $accessToken";
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          print(error);
          String newAcessToken = await getNewAccessToken(refreshToken);
          error.requestOptions.headers["Authorization"] = newAcessToken;

          return handler.resolve(await dio.fetch(error.requestOptions));
        }
      },
    ));
  }

}
