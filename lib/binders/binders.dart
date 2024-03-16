import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/controller/product_image_controller.dart';
import 'package:frontend/controller/theme_controller.dart';
// import 'package:frontend/controller/theme_controller.dart';
import 'package:get/get.dart';

class Binders extends Bindings {
  @override
  void dependencies() {
    // Get.put(ThemeControllers());
    Get.put(ThemeControllers());
    Get.put(LoginController());
    Get.put(ProductImageController());
    Get.put(CategoryController());
    Get.put(LanguageController());
  }
}
