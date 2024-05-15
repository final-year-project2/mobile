import 'package:dio/dio.dart' as dio;
import 'package:frontend/controller/Product_controller.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart';
import 'package:frontend/services/http_services.dart';
import 'package:frontend/controller/sellerController.dart';
import 'dart:io'; // Import Dart's IO package to work with files
import 'dart:convert';

class ProductService extends GetxController {
  final HttpServices httpServices = HttpServices();
  Future<dio.FormData> prepareFormData() async {
    final productController = Get.find<ProductController>();
    final seller = Get.find<SellerController>();
    // Prepare FormData
    final formData = dio.FormData();

    formData.fields.addAll([
      MapEntry('seller', seller.sellerId.toString()),
      MapEntry('title', productController.title.value),
      MapEntry('description', productController.description.value),
      MapEntry('number_of_tickets',
          productController.number_of_tickets.value.toString()),
      MapEntry('prize_categories', productController.prizeCategory.value),
    ]);
    // Convert selectedCategories to JSON array
    // Convert selectedCategories to JSON array
    // Convert selectedCategories to a JSON list
    //final selectedCategoriesJson = jsonEncode(productController.toJsonArray());

    // Add prize_categories as a JSON list
    //formData.fields.add(MapEntry('prize_categories', selectedCategoriesJson));
    try {
      if (productController.image_1.value != null) {
        final image_1 = await dio.MultipartFile.fromFile(
          productController.image_1.value!.path,
          filename: 'image_1.jpg',
          contentType: MediaType('image', 'jpg'),
        );
        formData.files.add(MapEntry('image_1', image_1));
      }

      if (productController.image_2.value != null) {
        final image_2 = await dio.MultipartFile.fromFile(
          productController.image_2.value!.path,
          filename: 'image_2.jpg',
          contentType: MediaType('image', 'jpg'),
        );
        formData.files.add(MapEntry('image_2', image_2));
      }

      if (productController.image_3.value != null) {
        final image_3 = await dio.MultipartFile.fromFile(
          productController.image_3.value!.path,
          filename: 'image_3.jpg',
          contentType: MediaType('image', 'jpg'),
        );
        formData.files.add(MapEntry('image_3', image_3));
      }
    } catch (e) {
      print('Error adding image files to FormData: $e');
      // Handle the error appropriately, e.g., show an error message to the user
    }

    return formData;
  }

  Future<void> sendProductDataToDatabase() async {
    final formData = await prepareFormData();
    httpServices.init(); // Ensure this is called before making requests

    // Send the POST request using the endpoint path
    try {
      final response =
          await httpServices.postRequest('product/save-ticket/', formData);
      // Use the endpoint path
      if (response.statusCode == 201) {
        // Handle success
        print('Product data sent successfully');
      } else {
        // Handle error
        print('`Fai`led to send product data');
      }
    } on dio.DioException catch (e) {
      print('Error sending product data: $e');
    }
  }
}
