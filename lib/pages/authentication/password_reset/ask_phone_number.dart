import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/ask_phone_number_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

class AskPhoneNumberForPasswordReset extends StatelessWidget {
  // const AskPhoneNumberForPasswordReset({super.key});
  final controller = Get.find<AskPhoneNumber>();
  TextEditingController phoneNumbereditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Forgot your password',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace(50),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 25, 50, 0),
              child: Text(
                  textAlign: TextAlign.center,
                  'Forgot your password?it happens,Just enter your number we\'ll send you OTP then follow the instruction',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                      height: 1.34,
                      wordSpacing: 3)),
            ),
            VerticalSpace(20),
            CustomForm(
              editingController: phoneNumbereditingController,
              isPassword: false,
              hintText: 'Enter your Phone number',
            ),
            VerticalSpace(20),
            GestureDetector(
                onTap: () async {
                  String phonenumber = phoneNumbereditingController.text;
                  controller.phoneNumber = phonenumber.obs;

                  try {
                    final response = await controller
                        .askPhoneNumberForPasswordReset(phonenumber);
                    if (response.statusCode == 200) {
                      controller.isLoading = false.obs;
                      Get.toNamed('/reciveotp');
                    } else {
                      print(
                          'error occured calling function askphone number for password reset with status code ${response.statusCode}');
                    }
                  } catch (e) {
                    controller.isLoading = false.obs;
                    print('error ${e}');
                  }
                },
                child: DefaultButton('Continue', controller.isLoading)),
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
