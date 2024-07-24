// import 'package:frontend/pages/authentication/categories.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var selectedCategory = ''.obs;

  void toggleCategory(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = ''; // Deselect if already selectedP
    } else {
      selectedCategory.value = category; // Select the new category
    }
  }
}
