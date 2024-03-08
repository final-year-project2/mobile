import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LoginController extends GetxController {
  RxBool isPasswordVissible = false.obs;
  RxBool itIsNotPassword = false.obs;
  void TogglePasswordVissiblity() {
    print('toggle called');
    isPasswordVissible.toggle();
  }
}
