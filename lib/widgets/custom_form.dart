// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:frontend/constants.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/widgets/layout.dart';

class CustomForm extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool? isPassword;
  final bool? readonly;
  Function(String)? onchanged;
  Function()? ontap;
  TextEditingController? editingController;

  //dependency injection
  final controller = Get.find<LoginController>();

  CustomForm({
    Key? key,
    this.labelText,
    this.hintText,
    this.isPassword,
    this.readonly,
    this.onchanged,
    this.ontap,
    this.editingController,
  }) : super(key: key);

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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: editingController,
                readOnly: readonly ?? false,
                onTap: ontap,
                style: TextStyle(decoration: TextDecoration.none),
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
