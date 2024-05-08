import 'package:frontend/controller/ask_phone_number_controller.dart';
import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/controller/mega_product_controller.dart';
import 'package:frontend/controller/new_password_controller.dart';
import 'package:frontend/controller/otp_controller.dart';
import 'package:frontend/controller/product_image_controller.dart';
import 'package:frontend/controller/signup_controller.dart';
import 'package:frontend/controller/theme_controller.dart';
import 'package:frontend/controller/verify_otp_password_reset_controller.dart';
import 'package:frontend/controller/wallet_controller.dart';
import 'package:frontend/pages/mainscreens/homepage.dart';
// import 'package:frontend/controller/theme_controller.dart';
import 'package:get/get.dart';

class Binders extends Bindings {
  @override
  void dependencies() {
    // Get.put(ThemeControllers());
    Get.put(ThemeControllers());
    Get.put(WalletController());
    Get.put(OTPController());
    Get.put(SignUpController());
    Get.put(AskPhoneNumber());
    Get.put(VerifyOtpPasswordResetController());
    Get.put(NewPasswordController());
    Get.put(MegaProductController());
    Get.put(HomePage());

    Get.put(LoginController());
    Get.lazyPut(() => ProductImageController());

    Get.put(() => CategoryController());
    Get.put(LanguageController());
  }
}
