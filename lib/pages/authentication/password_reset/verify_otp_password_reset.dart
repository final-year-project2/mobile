import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/ask_phone_number_controller.dart';
import 'package:frontend/controller/otp_controller.dart';
import 'package:frontend/controller/signup_controller.dart';
import 'package:frontend/controller/verify_otp_password_reset_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ReciveOTP extends StatelessWidget {
  final controller = Get.find<VerifyOtpPasswordResetController>();
  TextEditingController editingController = TextEditingController();
  final phoneNumberController = Get.find<AskPhoneNumber>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final spacing = screenSize.height * 0.15;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'VERIFY'.tr,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'ENTER_OTP'.tr,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(139, 139, 139, 1),
                  ),
                ),
              ),
              VerticalSpace(30),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 10, 18, 0),
                child: PinCodeTextField(
                  controller: editingController,
                  keyboardType: TextInputType.phone,
                  autoFocus: true,
                  appContext: context,
                  length: 4,
                  onCompleted: (value) async {
                    print('Completed :$value');
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeColor: Colors.greenAccent,
                    inactiveColor: primaryColor,
                    selectedColor: Colors.greenAccent,
                  ),
                ),
              ),
              VerticalSpace(spacing),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: GestureDetector(
                      onTap: () async {
                        String phoneNumber =
                            phoneNumberController.phoneNumber.value;
                        controller.passwordOtp = editingController.text.obs;
                        Get.toNamed('newpassword');
                        String otp = editingController.text;
                        controller.passwordResetOtpVerification(
                            otp, phoneNumber);
                        //here the phone number indicates the otp to make it similar to backendfiled
                      },
                      child: DefaultButton('CONTINUE'.tr, false.obs)))
            ],
          ),
        ),
      ),
    );
  }
}
