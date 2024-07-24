import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PurchaseSuccess extends StatelessWidget {
  const PurchaseSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GestureDetector(
            //   onTap: (){
            //     Get.back();
            //     Get.back();
            //     Get.back();
            //   },
            //   child: Center(
            //     child: Text('success'),
            //   ),
            // )
            SizedBox(
              height: screenSize.height * 0.4,
              width: screenSize.width,
              child: Lottie.asset(
                'assets/success2.json',
                animate: true,
                backgroundLoading: true,
              ),
            ),
            Text(
              'Success',
              style: TextStyle(
                  color: thirdColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () {
                  Get.back();
                  Get.back();
                  Get.back();
                },
                child: DefaultButton('Go Back', false.obs))
          ],
        ),
      ),
    );
  }
}
