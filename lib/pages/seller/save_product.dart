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
      MapEntry('price_of_ticket',
          productController.price_of_ticket.value.toString()),
    ]);
    // Convert selectedCategories to JSON array
    // Convert selectedCategories to JSON array
    // Convert selectedCategories to a JSON list
    //final selectedCategoriesJson = jsonEncode(productController.toJsonArray());

    // Add prize_categories as a JSON list
    //formData.fields.add(MapEntry('prize_categories', selectedCategoriesJson));
    try {
      final List<dio.MultipartFile> imageFiles = [];

      // Iterate through each image controller to add to FormData
      for (int i = 0; i < 3; i++) {
        final imageController = i == 0
            ? productController.image_1
            : i == 1
                ? productController.image_2
                : productController.image_3;

        if (imageController.value != null) {
          // Get file extension from the file path
          final String fileExtension =
              imageController.value!.path.split('.').last.toLowerCase();

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
            imageController.value!.path,
            filename: 'image_${i + 1}.$fileExtension',
            contentType: MediaType('image', fileExtension),
          );

          imageFiles.add(image);
        }
      }

      // Add image files to FormData
      formData.files.addAll(imageFiles.map((image) =>
          MapEntry('image_${imageFiles.indexOf(image) + 1}', image)));
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
          await httpServices.postRequest('/product/save-ticket/', formData);
      // Use the endpoint path
      if (response.statusCode == 201) {
        // Handle success Tes
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
