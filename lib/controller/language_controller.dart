import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  void toggleLanguage() {
    if (Get.locale!.languageCode == 'en') {
      Get.updateLocale(Locale('am', 'Et')); // Change to Spanish
    } else {
      Get.updateLocale(Locale('en', 'US')); // Change back to English
    }
  }
}
