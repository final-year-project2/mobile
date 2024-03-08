import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/progress_indicator.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBox(2),
              VerticalSpace(30),
              Text(
                'Prize Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              VerticalSpace(10),
              Text(
                'How many tickets want to be sold',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              CustomForm(
                isPassword: false,
                hintText: 'e.g 100',
              ),
              VerticalSpace(30),
              Text(
                'Enter Prize category',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              CustomForm(
                isPassword: false,
                hintText: 'Click here',
              ),
              VerticalSpace(450),
              GestureDetector(
                onTap: () => Get.toNamed('/producimages'),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: DefaultButton('Continue'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
