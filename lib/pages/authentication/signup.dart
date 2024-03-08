import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(),
              CustomForm(
                isPassword: false,
                // labelText: 'User name',
                hintText: 'User name',
              ),
              VerticalSpace(20),
              CustomForm(
                isPassword: false,
                hintText: 'Email',
              ),
              VerticalSpace(20),
              CustomForm(
                isPassword: true,
                // labelText: 'Pssword',
                hintText: 'password',
              ),
              VerticalSpace(20),

              CustomForm(
                isPassword: false,
                // labelText: 'Pssword',
                hintText: 'confirm password ',
              ),
              VerticalSpace(20),
              CustomForm(
                isPassword: false,
                // labelText: 'Pssword',
                hintText: 'Phone number ',
              ),

              VerticalSpace(50),
              GestureDetector(
                  onTap: () {
                    Get.toNamed('/category');
                  },
                  child: DefaultButton('Sign up')),
              Padding(
                padding: EdgeInsets.all(38.0),
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
              // DefaultButton('chaw')
            ],
          ),
        ),
      ),
    );
  }
}
