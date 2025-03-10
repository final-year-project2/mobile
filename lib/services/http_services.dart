import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final tokenBox = GetStorage();

var refreshToken = tokenBox.read('refreshToken');
var accessToken = tokenBox.read('accessToken');

class HttpServices {
  final BASE_URL = dotenv.env['BASE_URL'];
  Dio dio = Dio();

  Future<Response> postRequest(String url, var data) async {
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
    } on DioException catch (e) {
      print('Error on post method: $e');
      throw Exception(e.message); // You can customize error handling as needed
    }
  }

  Future<Response> getRequest(String url, {dynamic data}) async {
    print(accessToken);
    try {
      final response = await dio.get(
        url,
        queryParameters: data, // Use queryParameters for GET requests
      );
      return response;
    } on DioException catch (e) {
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
    } on DioException catch (e) {
      print('Error on patch method: $e');
      throw Exception(e.message);
    }
  }

  // Future<String> getNewAccessToken(String tokenRefresh) {
  //   final response;
  //   try {
  //     response = postRequest('/user/api/token/refresh/', tokenRefresh).toString();

  //     return response;
  //   } on DioException catch (e) {
  //     print('Error on patch method$e');
  //     throw Exception(e);
  //   }
  // }

  Future<String> getNewAccessToken(String tokenRefresh) async {
    try {
      final response =
          await postRequest('/user/api/token/refresh/', tokenRefresh);

      if (response.statusCode == 200) {
        return response
            .data['access']; // Adjust this based on your API response structure
      } else {
        throw Exception('Failed to refresh token');
      }
    } on DioException catch (e) {
      print('Error on patch method: $e');
      throw Exception(e);
    }
  }

  void init() {
    dio = Dio(BaseOptions(
        baseUrl: BASE_URL ?? "",
        connectTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30)));
  }

  void initAuthenticated() {
    dio.options.baseUrl = BASE_URL ?? "";
    dio.options.headers["Authorization"] = "Bearer $accessToken";
    dio.options.headers["Content-Type"] = "application/json"; // Add this line

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = "Bearer $accessToken";
        options.headers['Content-Type'] = "application/json";

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

  // void initAuthenticated() {
  //   dio.options.baseUrl = BASE_URL ?? "";
  //   dio.options.headers["Authorization"] = "Bearer $accessToken";

  //   dio.interceptors.add(InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       options.headers['Authorization'] = "Bearer $accessToken";
  //       return handler.next(options);
  //     },
  //     onError: (error, handler) async {
  //       if (error.response?.statusCode == 401) {
  //         print(error);
  //         try {
  //           print('Token$refreshToken');
  //           print('Access$accessToken');
  //           String newAccessToken = await getNewAccessToken(refreshToken);
  //           dio.options.headers["Authorization"] =
  //               "Bearer $newAccessToken"; // Update dio options with new token
  //           error.requestOptions.headers["Authorization"] =
  //               "Bearer $newAccessToken"; // Update request options with new token
  //           final cloneRequest = await dio.request(
  //             error.requestOptions.path,
  //             options: Options(
  //               method: error.requestOptions.method,
  //               headers: error.requestOptions.headers,
  //             ),
  //             data: error.requestOptions.data,
  //             queryParameters: error.requestOptions.queryParameters,
  //           );
  //           return handler.resolve(cloneRequest);
  //         } catch (e) {
  //           return handler.next(error);
  //         }
  //       } else {
  //         return handler.next(error);
  //       }
  //     },
  //   ));
  // }
}
