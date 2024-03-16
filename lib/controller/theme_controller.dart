import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeControllers {
  RxBool isLightTheme = true.obs;

  ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
  ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
