import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/controller/product_image_controller.dart';
import 'package:get/get.dart';

class Binders extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(ProductImageController());
    Get.put(CategoryController());
  }
}
