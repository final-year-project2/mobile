import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/buttons.dart';

class LandingPage extends StatelessWidget {
  // const LandingPage({super.key});

  final controller = Get.find<LanguageController>();
  final themecontroller = Get.find<ThemeControllers>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/landing.png'),
            VerticalSpace(30),
            // Text(
            //   'LOGO',
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: primaryColor,
            //       fontSize: 23),
            // ),

            Image(
              image: AssetImage('assets/cropedlogo.png'),
              width: 150,
              height: 150,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
              child: Text(
                'AD'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29,
                  color: grayTextColor,
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Get.toNamed('mainpage');
                },
                child: DefaultButton('BROWSEPRIZE'.tr, false.obs)),
            VerticalSpace(28),
            GestureDetector(
              onTap: () {
                // Get.toNamed('/signIn');
                Get.toNamed('/signin');
              },
              child: Container(
                height: 49,
                width: 342,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  'SIGNIN'.tr,
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ),
            ),
            VerticalSpace(30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: HorizontalLine(height: 1, width: 120),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text('OR'.tr),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: HorizontalLine(height: 1, width: 120),
                ),
              ],
            ),
            VerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('NOACCOUNT'.tr),
                HorizontalSpace(5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/signup');
                  },
                  child: Text(
                    'SIGNUP'.tr,
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
            VerticalSpace(20),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'PRIVACY'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: fotterTextColor)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: 'TERM'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                      TextSpan(
                          text: 'AND'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: fotterTextColor)),
                      TextSpan(
                          text: 'POLICY'.tr,
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                      TextSpan(
                          text: 'AGREED'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: fotterTextColor))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  print(
                      '=========================================================================');
                  themecontroller.toggleTheme();
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 129, 129, 129),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Change theme',
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
