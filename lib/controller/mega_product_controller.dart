import 'package:get/get.dart';

class MegaProductController extends GetxController {
  RxString productDetail = ''.obs;

  RxList<String> selectedCategories = <String>[].obs;

  void addToList(String selected) {
    selectedCategories.add(selected);
  }
}
