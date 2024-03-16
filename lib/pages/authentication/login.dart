import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Logo(),
                ),
                VerticalSpace(30),
                CustomForm(
                  // labelText: 'Email',
                  hintText: ' Email',
                  isPassword: false,
                ),
                VerticalSpace(30),
                CustomForm(
                  // labelText: 'Password',
                  hintText: ' Password',
                  isPassword: true,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 30, 0),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(fontSize: 11, color: fotterTextColor),
                      ),
                    )
                  ],
                ),
                VerticalSpace(40),
                GestureDetector(
                    onTap: () {
                      Get.toNamed('/productdesciption');
                    },
                    child: DefaultButton('SIGNIN'.tr)),
                VerticalSpace(30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: HorizontalLine(height: 1, width: 120),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text('OR'.tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: HorizontalLine(height: 1, width: 120),
                    ),
                  ],
                ),
                VerticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('NOACCOUNT'.tr),
                    HorizontalSpace(5),
                    GestureDetector(
                      onTap: () => {
                        // print('oncorse${controller.isLightTheme.value}'),
                        Get.toNamed('/signup'),
                      },
                      child: Text(
                        'SIGNUP'.tr,
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
                VerticalSpace(150),
                // Container(
                //   height: 49,
                //   width: 342,
                //   decoration: BoxDecoration(
                //       border: Border.all(color: primaryColor),
                //       borderRadius: BorderRadius.circular(5)),
                //   child: Row(
                //     children: [
                //       Image.asset(
                //           width: 50, height: 50, 'assets/googlelogo.jpg'),
                //       HorizontalSpace(50),
                //       Center(
                //           child: Text(
                //         'Continue with Google',
                //         style: TextStyle(
                //             // color: primaryColor,
                //             // fontWeight: FontWeight.bold,
                //             fontSize: 15),
                //       )),
                //     ],
                //   ),
                // ),
                VerticalSpace(40),
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <InlineSpan>[
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
                )
              ],
            ),
          ),
        ));
  }
}
