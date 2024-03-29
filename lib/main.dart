import 'package:flutter/material.dart';
import 'package:frontend/binders/binders.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/controller/theme_controller.dart';
import 'package:frontend/languages.dart';
import 'package:frontend/pages/authentication/categories.dart';
import 'package:frontend/pages/authentication/login.dart';
import 'package:frontend/pages/authentication/otp.dart';
import 'package:frontend/pages/authentication/signup.dart';
import 'package:frontend/pages/landing_page.dart';
import 'package:frontend/pages/onboarding/onboarding_page.dart';
import 'package:frontend/pages/onboarding/page1.dart';
import 'package:frontend/pages/seller/product_description.dart';
import 'package:frontend/pages/seller/product_detail.dart';
import 'package:frontend/pages/seller/product_image.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeController = Get.put(ThemeControllers());
  await themeController.loadThemePreference();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeControllers>();

    return Obx(() => GetMaterialApp(
          initialBinding: Binders(),
          darkTheme: themeController.darkTheme,
          themeMode: themeController.isLightTheme.value
              ? ThemeMode.light
              : ThemeMode.dark,
          translations: Languages(),
          locale: Locale('en', 'Us'),
          fallbackLocale: Locale('en', 'Us'),
          debugShowCheckedModeBanner: false,
          theme: themeController.lightTheme,
          initialRoute: "/landingpage",
          getPages: [
            GetPage(
                name: '/landingpage',
                page: () => LandingPage(),
                binding: Binders()),
            GetPage(name: '/signin', page: () => Login()),
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
// GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//       ),
//       initialRoute: "/onboarding",
//       getPages: [
//         GetPage(name: '/onboarding', page:()=> onboarding_page()),
//         GetPage(
//             name: '/landingpage',
//             page: () => LandingPage(),
//             binding: Binders()),
//         GetPage(name: '/signin', page: () => SignIn()),
//         GetPage(name: '/signup', page: () => SignUp()),
//         GetPage(name: '/category', page: () => Category()),
//         GetPage(
//           name: '/productdesciption',
//           page: () => ProductDesciption(),
//         ),
//         GetPage(
//           name: '/productdetail',
//           page: () => ProductDetail(),
//         ),
//         GetPage(name: '/producimages', page: () => ProducImages()),
//         GetPage(name: '/otp', page: () => OTP()),
//       ],
//     );