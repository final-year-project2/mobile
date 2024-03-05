import 'package:flutter/material.dart';
import 'package:frontend/pages/authentication/login.dart';
import 'package:frontend/pages/landing_page.dart';
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
      initialRoute: "/landingPage",
      getPages: [
        GetPage(name: '/landingPage', page: () => LandingPage()),
        GetPage(name: '/signIn', page: () => SignIn())
      ],
    );
  }
}
