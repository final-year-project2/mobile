import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/controller/wallet_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:get_storage/get_storage.dart';

class Profile extends StatelessWidget {
  final tokenBox = GetStorage();
  Profile({super.key});
  final walletController = Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Balance'),
          Text('0'),
          VerticalSpace(10),
          Container(
              width: 150,
              height: 42,
              child: GestureDetector(
                  onTap: () async {
                    walletController.addMoneyToWallet(context);
                    walletController.verify();
                  },
                  child: DefaultButton('add Money', false.obs)))
        ],
      )),
    );
  }
}
