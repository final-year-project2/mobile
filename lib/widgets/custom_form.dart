import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

class CustomForm extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool? isPassword;
  Function(String)? onchanged;

  //dependency injection
  final controller = Get.find<LoginController>();

  CustomForm({
    this.labelText,
    this.hintText,
    this.isPassword,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(labelText ?? ''),
            // VerticalSpace(10),
            Container(
              width: 350,
              child: TextFormField(
                enableIMEPersonalizedLearning: true,
                onChanged: onchanged,
                obscureText: isPassword == true
                    ? controller.isPasswordVissible.value
                    : controller.itIsNotPassword.value,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  contentPadding: EdgeInsets.only(top: 20),
                  // border:InputBorder(borderSide: )
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),

                  hintText: hintText ?? '',
                  hintStyle: TextStyle(color: fotterTextColor, fontSize: 14),

                  //if the form is password add the visiblit icons if not add empty Text()
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.TogglePasswordVissiblity();
                    },
                    icon: isPassword == true
                        ? Icon(
                            color: fotterTextColor,
                            //Toggle between two icons based on the password is vissible or not
                            controller.isPasswordVissible == true
                                ? Icons.visibility
                                : Icons.visibility_off)
                        : Text(''),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
