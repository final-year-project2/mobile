import 'package:flutter/material.dart';
import 'package:frontend/binders/binders.dart';
import 'package:frontend/controller/theme_controller.dart';
import 'package:frontend/languages.dart';
import 'package:frontend/pages/authentication/categories.dart';
import 'package:frontend/pages/authentication/login.dart';
import 'package:frontend/pages/authentication/otp.dart';
import 'package:frontend/pages/authentication/signup.dart';
import 'package:frontend/pages/landing_page.dart';
import 'package:frontend/pages/seller/product_description.dart';
import 'package:frontend/pages/seller/product_detail.dart';
import 'package:frontend/pages/seller/product_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //
  // ;
  // ThemeControllers themeControllers = ThemeControllers();
  // MyApp({super.key});

  // This widget is the root of your application.
  // final themeController = Get.find<ThemeControllers>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binders(),
      // darkTheme: themeController.darkTheme,
      // themeMode: ThemeMode.dark,
      translations: Languages(),
      locale: Locale('en', 'Us'),
      fallbackLocale: Locale('en', 'Us'),
      debugShowCheckedModeBanner: false,
      // theme: themeController.lightTheme,
      initialRoute: "/landingpage",
      getPages: [
        GetPage(
          name: '/landingpage',
          page: () => LandingPage(),
        ),
        GetPage(name: '/signin', page: () => SignIn()),
        GetPage(name: '/signup', page: () => SignUp()),
        GetPage(name: '/category', page: () => Category()),
        GetPage(
          name: '/productdesciption',
          page: () => ProductDesciption(),
        ),
        GetPage(
          name: '/productdetail',
          page: () => ProductDetail(),
        ),
        GetPage(name: '/producimages', page: () => ProducImages()),
        GetPage(name: '/otp', page: () => OTP()),
      ],
    );
  }
}
