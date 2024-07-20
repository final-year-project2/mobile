import 'package:get/get.dart';
import 'dart:convert';
import 'package:frontend/controller/sellerController.dart';
import 'package:frontend/services/http_services.dart';
import 'package:frontend/pages/seller/seller_Registration.dart';
import 'package:frontend/pages/seller/product_description.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/landing_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserController extends GetxController {
  var userId = ''.obs;
  void setUserId(String id) {
    userId.value = id;
  }

  final BASE_URL = dotenv.env['BASE_URL'];
  Future<bool> checkIfUserIsSeller(String userId) async {
    final sellerController = Get.find<SellerController>();
    final formData = {'user_id': userId.toString()};
    try {
      final response = await HttpServices().postRequest(
        '$BASE_URL/product/check_seller/',
        formData,
      );

      if (response.statusCode == 200) {
        // Decode the response body to extract data
        Map<String, dynamic> responseData = json.decode(response.toString());

        // Check if the seller_id exists in the response data
        if (responseData.containsKey('seller_id')) {
          int sellerId = responseData['seller_id'];
          sellerController.setSellerId(sellerId);
          print('Seller ID: $sellerId');
          return true; // User is already a seller
        } else {
          // seller_id not found, user is not a seller
          return false;
        }
      } else if (response.statusCode == 404) {
        // User is not a seller
        return false;
      } else {
        // Error occurred
        print('Error: ${response}');
        return false;
      }
    } catch (e) {
      // Handle DioException or other exceptions
      print('Error: $e');
      return false;
    }
  }
}

//   Future<void> checkIfUserIsSeller(BuildContext context, String userId) async {
//     final sellerController = Get.find<SellerController>();
//     final formData = {'user_id': userId};
//     try {
//       final response = await HttpServices().postRequest(
//         'http://192.168.137.181:8000/product/check_seller/',
//         formData,
//       );

//       // Check the status code range for success
//       if (response.statusCode == 200) {
//         // Decode the response body to extract data
//         Map<String, dynamic> responseData = json.decode(response.toString());

//         // Check if the seller_id exists in the response data
//         if (responseData.containsKey('seller_id')) {
//           int sellerId = responseData['seller_id'];
//           sellerController.setSellerId(sellerId);
//           print('Seller ID: $sellerId');
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ProductDesciption()),
//           );
//           return; // Exit function after successful navigation
//         } else {
//           // User is not registered as a seller
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => SellerRegistrationPage()),
//           );
//           return; // Exit function after successful navigation
//         }
//       } else if (response.statusCode == 500) {
//         // Handle status code 400
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LandingPage()),
//         );
//         return; // Exit function after successful navigation
//       } else if (response.statusCode == 404) {
//         // Handle status code 404
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => SellerRegistrationPage()),
//         );
//         return; // Exit function after successful navigation
//       } else {
//         // Handle other errors
//         print('Error: ${response}');
//         // Handle error navigation here
//       }
//     } catch (e) {
//       // Handle DioException or other exceptions
//       print('Error: $e');
//       // Handle error navigation here
//     }
//   }
// }
