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
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeController = Get.put(ThemeControllers());
  await themeController.loadThemePreference();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //hemeC
  // ;p
  ThemeFile themeFile = ThemeFile();

  // MyApp({super.key});

  // This widget is the root of your application.
  // final themeController = Get.find<ThemeControllers>();

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeControllers>();
    return Obx(() => GetMaterialApp(
          initialBinding: Binders(),
          darkTheme: themeFile.darkTheme,
          themeMode: themeController.isLightTheme.value
              ? ThemeMode.light
              : ThemeMode.dark,
          translations: Languages(),
          locale: Locale('en', 'Us'),
          fallbackLocale: Locale('en', 'Us'),
          debugShowCheckedModeBanner: false,
          theme: themeFile.lightTheme,
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
        ));
  }
}
