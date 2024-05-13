// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:frontend/binders/binders.dart';
// import 'package:frontend/controller/language_controller.dart';
// import 'package:frontend/controller/theme_controller.dart';
// import 'package:frontend/languages.dart';
// import 'package:frontend/pages/authentication/categories.dart';
// import 'package:frontend/pages/authentication/login.dart';
// import 'package:frontend/pages/authentication/otp.dart';
// import 'package:frontend/pages/authentication/password_reset/ask_phone_number.dart';
// import 'package:frontend/pages/authentication/password_reset/newpassword.dart';
// import 'package:frontend/pages/authentication/password_reset/verify_otp_password_reset.dart';
// import 'package:frontend/pages/authentication/signup.dart';
// import 'package:frontend/pages/landing_page.dart';
// import 'package:frontend/pages/mainscreens/homepage.dart';
// import 'package:frontend/pages/mainscreens/main_page.dart';
// import 'package:frontend/pages/mainscreens/wallet/wallet.dart';

// import 'package:frontend/pages/seller/product_description.dart';
// import 'package:frontend/pages/seller/product_detail.dart';
// import 'package:frontend/pages/seller/product_image.dart';

// // Import your main.dart or the specific pages

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       initialRoute: '/landingpage',
//       getPages: [
//         GetPage(name: '/mainpage', page: () => MainPage()),
//         GetPage(name: '/profile', page: () => Wallet()),
//         GetPage(
//             name: '/landingpage',
//             page: () => LandingPage(),
//             binding: Binders()),
//         GetPage(name: '/signin', page: () => Login()),
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
//         GetPage(name: '/homepage', page: () => HomePage()),
//         GetPage(name: '/producimages', page: () => ProducImages()),
//         GetPage(name: '/otp', page: () => OTP()),
//         GetPage(
//             name: '/askphonenumber',
//             page: () => AskPhoneNumberForPasswordReset()),
//         GetPage(name: '/reciveotp', page: () => ReciveOTP()),
//         GetPage(name: '/newpassword', page: () => NewPassword()),
//       ],
//     );
//   }
// }
