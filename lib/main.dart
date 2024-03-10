import 'package:flutter/material.dart';
import 'package:frontend/binders/binders.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: "/landingpage",
      getPages: [
        GetPage(
            name: '/landingpage',
            page: () => LandingPage(),
            binding: Binders()),
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
