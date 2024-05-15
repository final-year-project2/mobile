import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:frontend/controller/UserController.dart';
import 'package:frontend/controller/sellerController.dart';
import 'package:frontend/services/http_services.dart';
import 'package:frontend/constants.dart';

class SellerRegistrationPage extends StatelessWidget {
  final sellerId = Get.find<UserController>();
  final sellerController = Get.find<SellerController>();

  Future<void> registerAsSeller(int userId) async {
    final formData = {'user_id': userId.toString()};
    HttpServices httpServices = HttpServices();
    httpServices.initAuthenticated();
    try {
      final response = await HttpServices().postRequest(
        'http://192.168.137.181:8000/product/become_seller/',
        formData,
      );

      if (response.statusCode == 200) {
        // Seller registration successful
        // Parse response JSON to get seller ID
        Map<String, dynamic> responseData = json.decode(response.toString());
        int sellerId = responseData['seller_id'];
        sellerController.setSellerId(sellerId);
        // User is already a seller
        Get.snackbar('Already Seller', 'You are already a seller',
            snackPosition: SnackPosition.BOTTOM);
        print('Seller ID: $sellerId');
        Get.toNamed('/productdesciption');
      } else if (response.statusCode == 201) {
        Map<String, dynamic> responseData = json.decode(response.toString());
        int sellerId = responseData['seller_id'];
        sellerController.setSellerId(sellerId);
        Get.snackbar('Success', 'You are now registered as a seller',
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed('/productdesciption');
        print('Seller ID: $sellerId');
      } else {
        Get.snackbar('Error', 'An error occurred. Please try again later',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      // Handle DioException
      Get.snackbar('Error', 'An error occurred. Please try again later',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> checkIfUserIsSeller(int userId) async {
    final formData = {'user_id': userId.toString()};
    try {
      final response = await HttpServices().postRequest(
        'http://192.168.137.181:8000/product/check_seller/',
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

  Future<void> _showConfirmationDialog(BuildContext context, int userId) async {
    print('Showing confirmation dialog');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register as Seller'),
          content: Text('Are you sure you want to register as a seller?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await registerAsSeller(userId); // Call registerAsSeller here
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seller Registration',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 23),
            ),
            VerticalSpace(200),
            GestureDetector(
              onTap: () async {
                int userId = sellerId.userId;
                //Show confirmation dialog to register as seller
                _showConfirmationDialog(context, userId);
              },
              child: DefaultButton('Register as Seller', false.obs),
            ),
            VerticalSpace(30),
            GestureDetector(
              onTap: () async {
                int userId = sellerId.userId;
                bool isSeller = await checkIfUserIsSeller(userId);
                if (isSeller) {
                  // User is already a seller, allow them to post
                  Get.toNamed(
                      '/productdesciption/'); // Navigate to post product screen
                } else {
                  // User is not a seller, show snackbar message
                  Get.snackbar(
                      'Register First', 'Please register as a seller first',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: DefaultButton('Post Product', false.obs),
            ),

            //   ElevatedButton(
            //     onPressed: () async {
            //       int userId = sellerId.userId;
            //       // Show confirmation dialog to register as seller
            //       _showConfirmationDialog(context, userId);
            //     },
            //     child: Text('Register as Seller'),
            //   ),

            //           ElevatedButton(
            //             onPressed: () async {
            //               int userId = sellerId.userId;
            //               bool isSeller = await checkIfUserIsSeller(userId);
            //               if (isSeller) {
            //                 // User is already a seller, allow them to post
            //                 Get.toNamed(
            //                     '/productdesciption/'); // Navigate to post product screen
            //               } else {
            //                 // User is not a seller, show snackbar message
            //                 Get.snackbar(
            //                     'Register First', 'Please register as a seller first',
            //                     snackPosition: SnackPosition.BOTTOM);
            //               }
            //             },
            //             child: Text('Post Product'),
            // ),
          ],
        ),
      ),
    );
  }
}
