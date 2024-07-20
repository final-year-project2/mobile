import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:frontend/controller/UserController.dart';
import 'package:frontend/controller/sellerController.dart';
import 'package:frontend/services/http_services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/landing_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:frontend/controller/product_image_controller.dart';
import 'dart:io';

class SellerRegistrationPage extends StatelessWidget {

  final sellerId = Get.find<UserController>();
  final sellerController = Get.find<SellerController>();
  //final controller = Get.find<ProductImageController>();
  final Rx<File?> selectedImage = Rx<File?>(null);
  final BASE_URL = dotenv.env['BASE_URL'];
  // Function to handle image selection
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final fileSize = await file.length(); // Get file size in bytes
      final fileSizeInMB = fileSize / (1024 * 1024); // Convert to MB
      if (fileSizeInMB > 9) {
        // Show scaffold if image size exceeds 9MB
        Get.snackbar(
          'Error',
          'Image size must be less than 9MB',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      selectedImage.value = File(pickedFile.path);
    } else {
      selectedImage.value = null; // Or initialize with a default image file
    }
  }

  Future<void> registerAsSeller(String userId, File? imageFile) async {
    final HttpServices httpServices = HttpServices();
    final formData = dio.FormData.fromMap({'user_id': userId});

    // Check if an image file is provided
    if (imageFile != null) {
      try {
        final String fileExtension =
            imageFile.path.split('.').last.toLowerCase();

  final BASE_URL = dotenv.env['BASE_URL'];


        // Determine content type based on file extension
        String contentType;
        switch (fileExtension) {
          case 'jpg':
          case 'jpeg':
            contentType = 'image/jpeg';
            break;
          case 'png':
            contentType = 'image/png';
            break;
          case 'gif':
            contentType = 'image/gif';
            break;
          // Add cases for other image formats as needed
          default:
            // Set a default content type
            contentType = 'application/octet-stream';
            break;
        }

        // Create multipart file
        final image = await dio.MultipartFile.fromFile(
          imageFile.path,
          filename: 'image.$fileExtension',
          contentType: MediaType('image', fileExtension),
        );


        // Add image file to formData
        formData.files.add(MapEntry('image', image));
      } catch (e) {
        print('Error adding image file to FormData: $e');
        // Handle the error appropriately
        return;
      }
    }

    // Send the POST request to become a seller endpoint
    try {
      final response = await httpServices.postRequest(
        '$BASE_URL/product/become_seller/',

        formData,
      );
      if (response.statusCode == 200) {
        // Seller r`egistration successful
        // Parse response JSON to get seller ID
        Map<String, dynamic> responseData = json.decode(response.toString());
        int sellerId = responseData['seller_id'];
        print('seller-id $sellerId');
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
      } else if (response.statusCode == 404) {
        await Get.snackbar('Not User', 'Please Login First',
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed('/landingpage');
      } else {
        await Get.snackbar('Not User', 'Please Login First',
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed('/landingpage');
      }
    } catch (e) {
      // Handle DioException
      await Get.snackbar('Not User', 'Please Login First',
          snackPosition: SnackPosition.BOTTOM);
      Get.toNamed('/landingpage');
    }
  }

  Future<void> _showConfirmationDialog(
      BuildContext context, String userId) async {

  Future<bool> checkIfUserIsSeller(int userId) async {
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

//

//
  Future<void> _showImageSourceActionSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerticalSpace(100),
              Text(
                'Seller Registration',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 23),
              ),
              VerticalSpace(20),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Profile_photo'.tr,
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              VerticalSpace(50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    await _showImageSourceActionSheet(context);
                  },
                  child: Obx(() => Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: selectedImage.value != null
                                ? DecorationImage(
                                    image: FileImage(selectedImage.value!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: fotterTextColor),
                          ),
                          child: selectedImage.value != null
                              ? null
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'TITLEs_PHOTO'.tr,
                                      style: TextStyle(),
                                    ),
                                    VerticalSpace(6),
                                    IconButton(
                                      onPressed: () async {
                                        await _showImageSourceActionSheet(
                                            context);
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                        ),
                      )),
                ),
              ),

              VerticalSpace(200),
              GestureDetector(
                onTap: () async {
                  String userId = sellerId.userId.value;
                  //Show confirmation dialog to register as seller
                  _showConfirmationDialog(context, userId);
                },
                child: DefaultButton('Register as Seller', false.obs),
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
      ),
    );
  }
}
