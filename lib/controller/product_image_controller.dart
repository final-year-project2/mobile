import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:frontend/controller/Product_controller.dart'; // Import the ProductController

class ProductImageController extends GetxController {
  final picker = ImagePicker();
  final _images = RxList<XFile>([]); // Use RxList for reactive updates

  // No need for setProductController method anymore

  Future<void> pickImage(int index) async {
    final result = await picker.pickImage(source: ImageSource.gallery);
    print('Result: $result');
    if (result != null) {
      _images.insert(index, result);
      print('Image picked: ${result.path}');
      final productController = Get.find<ProductController>();
      final file = File(result.path);
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
