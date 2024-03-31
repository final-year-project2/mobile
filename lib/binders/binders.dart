import 'package:frontend/controller/ask_phone_number_controller.dart';
import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/controller/new_password_controller.dart';
import 'package:frontend/controller/otp_controller.dart';
import 'package:frontend/controller/product_image_controller.dart';
import 'package:frontend/controller/signup_controller.dart';
import 'package:frontend/controller/theme_controller.dart';
import 'package:frontend/controller/verify_otp_password_reset_controller.dart';
// import 'package:frontend/controller/theme_controller.dart';
import 'package:get/get.dart';

class Binders extends Bindings {
  @override
  void dependencies() {
    // Get.put(ThemeControllers());
    Get.put(ThemeControllers());
    Get.put(OTPController());
    Get.put(SignUpController());
    Get.put(AskPhoneNumber());
    Get.put(VerifyOtpPasswordResetController());
    Get.put(NewPasswordController());

    Get.put(LoginController());
    Get.lazyPut(() => ProductImageController());

    Get.lazyPut(() => CategoryController());
    Get.put(LanguageController());
  }
}
