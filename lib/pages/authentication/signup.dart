import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/otp_controller.dart';
import 'package:frontend/controller/signup_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flash/flash.dart';
import 'package:get/get_rx/get_rx.dart';

class SignUp extends StatelessWidget {
  // var screensize  = MediaQuery.of(context)
  // RxBool isSucessful = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final controller = Get.find<SignUpController>();
  final otpController = Get.find<OTPController>();

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
                editingController: userNameController,
                hintText: 'User name',
              ),

              // VerticalSpace(20),
              // CustomForm(
              //   editingController: emailController,
              //   isPassword: false,
              //   hintText: 'Email',
              // ),
              VerticalSpace(20),
              CustomForm(
                isPassword: true,
                editingController: passwordController,
                hintText: 'password',
              ),
              VerticalSpace(20),

              CustomForm(
                isPassword: true,
                editingController: passwordController,
                hintText: 'confirm password ',
              ),
              VerticalSpace(20),
              CustomForm(
                isPassword: false,
                // labelText: 'Pssword',
                editingController: phoneNumberController,
                hintText: 'eg.913377471',
              ),

              VerticalSpace(50),
              GestureDetector(
                  onTap: () async {
                    String name = userNameController.text;
                    // final response;
                    String password = passwordController.text;
                    String Phone_no = phoneNumberController.text;
                    // Get.toNamed('/otp');

                    // print('email:$Email');
                    // print('username:$name');
                    // print('PhoneNumber :$Phone_no');
                    // print('password :$password');
                    try {
                      final response =
                          await controller.signUp(name, Phone_no, password);
                      // controller.isLoading = true.obs;
                      controller.isLoading;
                      print('seelof${response.statusCode}');
                      print('responsex:$response');

                      ;

                      if (response.statusCode == 201) {
                        controller.id = response.data['id'];
                        print('idd${controller.id}');

                        controller.phoneNumber = response.data['Phone_no'];
                        controller.isLoading = false.obs;
                        Get.toNamed('/otp');
                      } else {
                        controller.isLoading = false.obs;

                        print('statuscodeSignup${response.statusCode}');
                        print('error');
                      }
                    } catch (e) {
                      print('error calling signup: $e');
                    }
                  },
                  child: Obx(
                      () => DefaultButton('Sign up', controller.isLoading))),
              VerticalSpace(20),

              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 45.0),
              //       child: HorizontalLine(height: 1, width: 120),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(right: 10.0),
              //       child: Text('or'),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //       child: HorizontalLine(height: 1, width: 120),
              //     ),
              //   ],
              // ),
              VerticalSpace(10),
              // Container(
              //   height: 49,
              //   width: 342,
              //   decoration: BoxDecoration(
              //       border: Border.all(color: primaryColor),
              //       borderRadius: BorderRadius.circular(5)),
              //   child: Row(
              //     children: [
              //       Image.asset(width: 50, height: 50, 'assets/googlelogo.jpg'),
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
