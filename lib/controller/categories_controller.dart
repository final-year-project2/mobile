// import 'package:frontend/pages/authentication/categories.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList<String> selectedCategories = <String>[].obs;
  void toggleCategories(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }
}
