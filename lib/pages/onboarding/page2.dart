import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class page2 extends StatelessWidget {
  const page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 420,
            child: Lottie.asset('assets/boarding2.json',
                animate: true, backgroundLoading: true),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'create_acount'.tr,
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'page2description'.tr,
                  style: TextStyle(
                      color: optionalgrayTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: () => Get.toNamed('/landingpage'),
              child: DefaultButton("skip".tr, false.obs))
        ],
      ),
    );
  }
}
