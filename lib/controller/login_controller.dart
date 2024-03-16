import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isPasswordVissible = true.obs;
  RxBool itIsNotPassword = false.obs;
  void TogglePasswordVissiblity() {
    print('toggle called');
    isPasswordVissible.toggle();
  }
}
