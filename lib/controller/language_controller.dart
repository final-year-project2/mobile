import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  RxBool isEnglish = true.obs;
  void toggleLanguage(String languageType) {
    if (languageType == 'English') {
      isEnglish.value = true;
      Get.updateLocale(Locale('en', 'US'));
      _saveLanguagePreference(); 
    } 
    else{
      isEnglish.value = false;
      Get.updateLocale(Locale('am', 'Et'));
      _saveLanguagePreference();
    }
  }

  Future<void> _saveLanguagePreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isEnglish', isEnglish.value);
  }

  Future<void> loadLanguagePreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isEnglish.value = await prefs.getBool('isEnglish') ?? true;
  }

  @override
  void onInit() async{
    await loadLanguagePreference();
    toggleLanguage(isEnglish.value?'English':'አማረኛ');
    super.onInit();
  }
}
