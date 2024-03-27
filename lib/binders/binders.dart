import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/controller/product_image_controller.dart';
import 'package:frontend/controller/signup_controller.dart';
import 'package:frontend/controller/theme_controller.dart';
// import 'package:frontend/controller/theme_controller.dart';
import 'package:get/get.dart';

class Binders extends Bindings {
  @override
  void dependencies() {
    // Get.put(ThemeControllers());
    Get.lazyPut(() => ThemeControllers());
    Get.lazyPut(() => SignUpController());

    Get.put(LoginController());
    Get.lazyPut(() => ProductImageController());

    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => LanguageController());
  }
}
