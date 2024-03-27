import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeControllers extends GetxController {
  ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
  ThemeData lightTheme = ThemeData(
<<<<<<< HEAD
   
    primaryColor: primaryColor,
=======
    primaryColor:primaryColor,
>>>>>>> 95562b665f17fae4a2ee44d75b04fdba13b7e161
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  RxBool isLightTheme = true.obs;

  void toggleTheme() {
    print('function called');
    isLightTheme.value = !isLightTheme.value;
    _saveThemePreference();
  }

  Future<void> _saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLightTheme', isLightTheme.value);
  }

  Future<void> loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLightTheme.value = prefs.getBool('isLightTheme') ?? true;
  }
}

