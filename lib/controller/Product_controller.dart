import 'package:frontend/controller/product_image_controller.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:frontend/widgets/custom_form.dart';
import 'package:get/get_rx/get_rx.dart';

final imagecontrollers = Get.find<ProductImageController>();

class ProductController extends GetxController {
  RxString title = ''.obs;
  RxString description = ''.obs;
  RxInt number_of_tickets = 0.obs;
  RxString prizeCategory = ''.obs;
  // void addToList(String selected) {
  //   selectedCategories.add(selected);
  // }

  var image_1 = Rx<File?>(null);
  var image_2 = Rx<File?>(null);
  var image_3 = Rx<File?>(null);
  void setImage(int imageNumber, File newImage) {
    switch (imageNumber) {
      case 1:
        image_1.value = newImage;
        break;
      case 2:
        image_2.value = newImage;
        break;
      case 3:
        image_3.value = newImage;
        break;
      default:
        print('Invalid image number');
    }
  }

  // Method to clear an image
  void clearImage(int imageNumber) {
    switch (imageNumber) {
      case 1:
        image_1.value = null;
        break;
      case 2:
        image_2.value = null;
        break;
      case 3:
        image_3.value = null;
        break;
      default:
        print('Invalid image number');
    }
  }

  // Method to convert selectedCategories to JSON array
//   List<String> toJsonArray() {
//     return selectedCategories.map((category) => category).toList();
//   }
}
