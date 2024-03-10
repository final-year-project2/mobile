import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/progress_indicator.dart';
import 'package:get/get.dart';

class ProductDesciption extends StatelessWidget {
  const ProductDesciption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 50, 0, 0),
          child: ProgressBox(1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: ProgressBox(1),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 10),
              child: Text(
                'Describe about your product',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
              child: Text('Give your product a title',
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 0, 50),
              child: CustomForm(
                isPassword: false,
                hintText: 'laptop xkp',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 15),
              child: Text('Describe  your product in detail',
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 15)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                width: 350,
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: fotterTextColor)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/productdetail');
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 300, 0, 0),
                child: DefaultButton('Continue'),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
