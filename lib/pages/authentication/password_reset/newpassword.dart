import 'package:flutter/material.dart';
import 'package:frontend/controller/ask_phone_number_controller.dart';
import 'package:frontend/controller/new_password_controller.dart';
import 'package:frontend/controller/verify_otp_password_reset_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

class NewPassword extends StatelessWidget {
  final controller = Get.find<NewPasswordController>();
  final phoneNumberController = Get.find<AskPhoneNumber>();
  final passwordOtpController = Get.find<VerifyOtpPasswordResetController>();

  TextEditingController paswordEditingController = TextEditingController();
  TextEditingController confirmPaswordEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New password'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace(50),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 25, 50, 0),
              child: Text(
                  textAlign: TextAlign.center,
                  'Already there,now enter your new Password',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      height: 1.34,
                      wordSpacing: 3)),
            ),
            VerticalSpace(20),
            CustomForm(
              editingController: paswordEditingController,
              isPassword: true,
              hintText: 'Enter your New password here',
            ),
            VerticalSpace(10),
            CustomForm(
              editingController: confirmPaswordEditingController,
              isPassword: true,
              hintText: 'Confirm your new password here',
            ),
            VerticalSpace(20),
            GestureDetector(
                onTap: () async {
                  String password = paswordEditingController.text;
                  String phoneNumber = phoneNumberController.phoneNumber.value;
                  String otp = passwordOtpController.passwordOtp.value;
                  final response =
                      controller.newPassword(phoneNumber, otp, password);

                  Get.toNamed('/signin');
                },
                child: DefaultButton('Continue', false.obs)),
            VerticalSpace(20),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20.0, 5, 5, 0),
            //   child: Text(
            //       style: TextStyle(color: Color.fromARGB(255, 147, 145, 145)),
            //       'Never share your password with anyone else!'),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20.0, 5, 5, 20),
            //   child: Text(
            //       style: TextStyle(
            //           height: 1, color: Color.fromARGB(255, 147, 145, 145)),
            //       textAlign: TextAlign.center,
            //       'NOTE :WE never ask you to disclose your personal account password'),
            // ),
          ],
        ),
      ),
    );
  }
}
