import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/wallet_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

class Success extends StatelessWidget {
  final walletController = Get.find<WalletController>();
  final dateToday = DateFormat.yMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpace(screenSize.height * 0.16),
              // Container(
              //   child: Column(
              //     children: [],
              //   ),
              //   height: 32,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           colors: [primaryColor, whiteColor])),
              // ),
              Text(
                'Deposited To wallet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Image.asset(width: 150, 'assets/right.png'),
              VerticalSpace(15),
              Text(
                'Done',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              VerticalSpace(screenSize.height * 0.03),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
                child: Card(
                  color: whiteColor,
                  elevation: 2,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: primaryColor, width: 1),
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'User',
                                style: TextStyle(color: grayTextColor),
                              ),
                              Text('Natnael Sisay')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction status',
                                style: TextStyle(color: grayTextColor),
                              ),
                              Text(
                                'Successfull',
                                style: TextStyle(
                                    color: Colors.green[400],
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction reference',
                                style: TextStyle(color: grayTextColor),
                              ),
                              Text(
                                walletController.verificationResult?['data']
                                        ['reference'] ??
                                    '',
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount',
                                style: TextStyle(color: grayTextColor),
                              ),
                              Obx(() {
                                return walletController
                                        .isVerificationResultLoading.value
                                    ? Text('')
                                    : Text(
                                        walletController
                                                .verificationResult?['data']
                                                    ['amount']
                                                .toString() ??
                                            '',
                                      );
                              })
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(color: grayTextColor),
                              ),
                              Text(dateToday.toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              VerticalSpace(screenSize.height * 0.09),
              GestureDetector(
                  onTap: () async {
                    // walletController.verificationResult?['data']['amount'];
                    final responseBalance =
                        await walletController.getWalletInformations();
                    walletController.walletAmount.value =
                        responseBalance.balance;
                    walletController.walletInfoIsLoading.value = false;

                    ///calling transaction function to update the treansaction
                    ///
                    await walletController.getRecentTransaction();

                    Get.toNamed('/wallet');
                  },
                  child: DefaultButton('Continue', false.obs))
            ],
          ),
        ),
      ),
    );
  }
}
