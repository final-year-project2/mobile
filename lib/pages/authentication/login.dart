import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/controller/theme_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final themeControllers = Get.find<ThemeControllers>();
  final loginController = Get.find<LoginController>();
  TextEditingController phoneNumberControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

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
                  editingController: phoneNumberControler,
                  hintText: ' Phone number',
                  isPassword: false,
                ),
                VerticalSpace(30),
                CustomForm(
                  // labelText: 'Password',
                  hintText: ' Password',
                  editingController: passwordControler,
                  isPassword: true,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 30, 0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/askphonenumber');
                        },
                        child: Text(
                          'Forgot password?',
                          style:
                              TextStyle(fontSize: 15, color: fotterTextColor),
                        ),
                      ),
                    )
                  ],
                ),
                VerticalSpace(40),
                GestureDetector(
                    onTap: () async {
                      // print('PhoneNumbers:${phoneNumberControler.text }');
                      // print('password:${passwordControler.text}');
                      String Phone_no = phoneNumberControler.text;
                      String password = passwordControler.text;
                      print('Phoneno:$Phone_no');
                      print('pass:$password');

                      try {
                        final loginResponse = await loginController
                            .loginRequest(Phone_no, password);
                        if (loginResponse.statusCode == 200) {
                          String accessToken = loginResponse.data['access'];
                          String refreshToken = loginResponse.data['refresh'];
                          print('AcessToken${accessToken}');
                          print('RefreshToken${refreshToken}');
                          Get.toNamed('/productdesciption');
                        } else {
                          //popup,show incorrect combination
                          print('loginStatuscode:${loginResponse.statusCode}');
                        }
                      } catch (e) {}
                    },
                    child: DefaultButton('SIGNIN'.tr, false.obs)),
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
