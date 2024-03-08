import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                VerticalSpace(40),
                GestureDetector(
                    onTap: () {
                      Get.toNamed('/productdesciption');
                    },
                    child: DefaultButton('Sign in')),
                VerticalSpace(30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: HorizontalLine(height: 1, width: 120),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text('or'),
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
                    Text('Don\'t have an account?'),
                    HorizontalSpace(5),
                    GestureDetector(
                      onTap: () => {
                        Get.toNamed('/signup'),
                      },
                      child: Text(
                        'Sign up ',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
                VerticalSpace(100),
                Container(
                  height: 49,
                  width: 342,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Image.asset(
                          width: 50, height: 50, 'assets/googlelogo.jpg'),
                      HorizontalSpace(50),
                      Center(
                          child: Text(
                        'Continue with Google',
                        style: TextStyle(
                            // color: primaryColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                    ],
                  ),
                ),
                VerticalSpace(40),
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  ' By continuing you are agree with the xxxxx  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: fotterTextColor)),
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: 'Terms',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor)),
                          TextSpan(
                              text: ' and  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: fotterTextColor)),
                          TextSpan(
                              text: ' Policy notice ',
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor))
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
