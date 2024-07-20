import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:frontend/controller/Product_controller.dart'; // Import the ProductController

class ProductImageController extends GetxController {
  final picker = ImagePicker();
  final _images = RxList<XFile>([]); // Use RxList for reactive updates

  // No need for setProductController method anymore

  Future<void> pickImage(int index, ImageSource source) async {
    final result = await picker.pickImage(source: source);
    print('Result: $result');
    if (result != null) {
      final file = File(result.path);
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
      _images.insert(index, result);
      print('Image picked: ${result.path}');
      final productController = Get.find<ProductController>();
      print('File: $file');
      if (file.existsSync()) {
        print('File exists');
      } else {
        print('File does not exist');
      }
      productController.setImage(index + 1, file);
    }
  }

  List<XFile> get images => _images;
}
