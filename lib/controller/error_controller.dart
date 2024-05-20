import 'package:frontend/widgets/error.dart';
import 'package:get/get.dart';

class ErrorHandlerService extends GetxController { 
  void handleError(Exception exception) {
    Get.offAll(CustomErrorWidget(errorMessage: exception.toString()));
  }
}
