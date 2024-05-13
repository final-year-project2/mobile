import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/wallet_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

class AddMoneyToWallet extends StatelessWidget {
  AddMoneyToWallet({super.key});
  final walletController = Get.find<WalletController>();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add money'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Good morning',
                  style: TextStyle(color: grayTextColor, fontSize: 16),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/winning.png'),
                  radius: 20,
                )
              ],
            ),
            Text(
              'Natnael ',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            VerticalSpace(screensize.height * 0.2),
            // Text(
            //   'Amount',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.33),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screensize.width * 0.7,
                  child: TextFormField(
                    controller: textEditingController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: " ***********  ",
                      hintStyle: TextStyle(color: grayTextColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text(
                  'BIRR',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            VerticalSpace(screensize.height * 0.1),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
              child: GestureDetector(
                  onTap: () {
                    String userInput = textEditingController.text;
                    walletController.addMoneyToWallet(context, userInput);
                    walletController.chapaWebViewIsLoading.toggle();
                    Future.delayed(Duration(seconds: 1),
                        () => walletController.chapaWebViewIsLoading.toggle());
                    // Get.toNamed('success');
                  },
                  child: Obx(() => DefaultButton(
                      'Add Money ', walletController.chapaWebViewIsLoading))),
            )
          ],
        ),
      ),
    );
  }
}
