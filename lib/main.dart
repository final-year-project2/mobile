import 'package:flutter/material.dart';
import 'package:frontend/binders/binders.dart';
import 'package:frontend/controller/error_controller.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/controller/theme_controller.dart';
import 'package:frontend/languages.dart';
import 'package:frontend/models/user_ticket_model.dart';
import 'package:frontend/pages/authentication/categories.dart';
import 'package:frontend/pages/authentication/login.dart';
import 'package:frontend/pages/authentication/otp.dart';
import 'package:frontend/pages/authentication/password_reset/ask_phone_number.dart';
import 'package:frontend/pages/authentication/password_reset/newpassword.dart';
import 'package:frontend/pages/authentication/password_reset/verify_otp_password_reset.dart';
import 'package:frontend/pages/authentication/signup.dart';
import 'package:frontend/pages/landing_page.dart';
import 'package:frontend/pages/mainscreens/PurchaseSuccessPage.dart';
import 'package:frontend/pages/mainscreens/homepage.dart';
import 'package:frontend/pages/mainscreens/detail.dart';
import 'package:frontend/pages/mainscreens/main_page.dart';
import 'package:frontend/pages/mainscreens/previous_ticket.dart';
import 'package:frontend/pages/mainscreens/wallet/add_money_to_wallet.dart';
import 'package:frontend/pages/mainscreens/wallet/success.dart';
import 'package:frontend/pages/mainscreens/wallet/wallet.dart';
import 'package:frontend/pages/onboarding/onboarding_page.dart';
import 'package:frontend/pages/onboarding/page1.dart';
import 'package:frontend/pages/seller/active_ticket.dart';
import 'package:frontend/pages/seller/dashboard.dart';
import 'package:frontend/pages/seller/drawing_page.dart';
import 'package:frontend/pages/seller/live_ticket.dart';
import 'package:frontend/pages/seller/product_description.dart';
import 'package:frontend/pages/seller/product_detail.dart';
import 'package:frontend/pages/seller/seller_Registration.dart';
import 'package:frontend/pages/seller/product_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:chapa_unofficial/chapa_unofficial.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ErrorHandlerService());
  final themeController = Get.put(ThemeControllers());
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  await themeController.loadThemePreference();

  Chapa.configure(privateKey: "CHASECK_TEST-NMHnfnAw81g9EWXYoSm6FrobP7rePyRd");

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
          // initialRoute: "/detailpage",
          initialRoute: "/onboarding_page",
          getPages: [
            // GetPage(

            //   page: () => MainPage()),

            GetPage(name: '/profile', page: () => Wallet()),
            GetPage(name: '/page1', page: () => page1()),
            GetPage(name: '/onboarding_page', page: () => onboarding_page()),

            GetPage(name: '/mainpage', page: () => MainPage()),
            GetPage(name: '/draw', page: () => DrawTicket()),
            GetPage(name: '/wallet', page: () => Wallet()),

            // GetPage(name: '/profile', page: () => Profile()),
            GetPage(name: '/seller', page: () => SellerRegistrationPage()),
            // GetPage(name: '/detailpage', page: () => DetailPage(),
            //     binding: Binders()),
            GetPage(
                name: '/landingpage',
                page: () => LandingPage(),
                binding: Binders()),
            // GetPage(
            //   name: '/landingpage',
            //   page: () => LandingPage()),

            GetPage(name: '/signin', page: () => Login()),
            GetPage(name: '/signup', page: () => SignUp()),
            GetPage(name: '/category', page: () => Category()),
            GetPage(name: '/liveticket', page: () => LiveTicket()),
            GetPage(name: '/userticket', page: () => UserTickets()),

            GetPage(
              name: '/productdesciption',
              page: () => ProductDesciption(),
            ),
            GetPage(
              name: '/productdetail',
              page: () => ProductDetail(),
            ),
            GetPage(name: '/homepage', page: () => HomePage()),
            GetPage(name: '/activetickets', page: () => ActiveTickets()),

            GetPage(name: '/detailpage', page: () => DetailPage()),

            GetPage(name: '/producimages', page: () => ProducImages()),

            GetPage(name: '/otp', page: () => OTP()),

            GetPage(
              name: '/success',
              page: () => Success(),
            ),
            GetPage(name: '/addmoneytowallet', page: () => AddMoneyToWallet()),
            GetPage(name: '/homepage', page: () => HomePage()),
            GetPage(name: '/producimages', page: () => ProducImages()),
            GetPage(name: '/otp', page: () => OTP()),
            GetPage(
                name: '/askphonenumber',
                page: () => AskPhoneNumberForPasswordReset()),

            GetPage(name: '/reciveotp', page: () => ReciveOTP()),
            GetPage(name: '/dashboard', page: () => Dashboard()),

            GetPage(name: '/newpassword', page: () => NewPassword()),
            // PurchaseSuccessPage
            GetPage(name: '/PurchaseSuccess', page: () => PurchaseSuccess()),
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