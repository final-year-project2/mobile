import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:intl/intl/date_time.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';

import 'package:frontend/controller/wallet_controller.dart';
import 'package:frontend/models/wallet_model.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:get_storage/get_storage.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final walletController = Get.find<WalletController>();

  // String datae=DateFormat('MM-dd-yyyy').format(walletController.transactions.first.transactionDate)

  // void fetchData() async {
  //   final walletResponse = await walletController.getWalletInformations();
  //   walletController.walletAmount.value = walletResponse.balance;

  //   print('finalWalletResponse :${walletController.walletAmount}');
  // }

  final tokenBox = GetStorage();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        // scrollBehavior: ScrollBehavior.none,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            title: Text(
              "",
              style: TextStyle(color: blackColor, fontSize: 18),
            ),
            actions: [
              HorizontalSpace(15),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(size: 35, Icons.account_circle_sharp),
              ),
            ],
            expandedHeight: 180,
            flexibleSpace: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  width: screenSize.size.width,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                ),
                Positioned(
                  left: 39,
                  bottom: -60,
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: screenSize.size.width * 0.37,
                      width: screenSize.size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: homePageBannerColor2),
                    ),
                    Positioned(
                        top: 10,
                        left: 4,
                        child: Container(
                          width: screenSize.size.width * 0.8,
                          child: Column(
                            children: [
                              Text(
                                'Total Balance',
                                style:
                                    TextStyle(color: whiteColor, fontSize: 22),
                              ),
                              VerticalSpace(15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() => walletController
                                          .walletInfoIsLoading.value
                                      ? CircularProgressIndicator(
                                          color: primaryColor,
                                        )
                                      : Text(
                                          walletController.walletAmount.value,
                                          style: TextStyle(
                                              fontSize: 35, color: whiteColor),
                                        )),
                                  HorizontalSpace(5),
                                  Image.asset(width: 35, 'assets/birr2.png')
                                ],
                              )
                            ],
                          ),
                        ))
                  ]),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 70, 0, 0),
              child: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(35, 5, 15, 25),
              child: SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('addmoneytowallet');
                      },
                      child: Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                            color: colorForContrast,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: primaryColor, width: 1)),
                        child: Column(
                          children: [
                            VerticalSpace(5),
                            Image.asset(width: 30, 'assets/wallet.png'),
                            VerticalSpace(10),
                            Text(
                              'Add ',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    HorizontalLine(height: 80, width: 1),
                    Container(
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                          color: colorForContrast,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: primaryColor, width: 1)),
                      child: Column(
                        children: [
                          VerticalSpace(5),
                          Image.asset(width: 30, 'assets/bank.png'),
                          VerticalSpace(10),
                          Text(
                            'Pay out ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    HorizontalLine(height: 80, width: 1),
                    Container(
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                          color: colorForContrast,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: primaryColor, width: 1)),
                      child: Column(
                        children: [
                          VerticalSpace(5),
                          Image.asset(width: 30, 'assets/sendmoney.png'),
                          VerticalSpace(10),
                          Text(
                            'send ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Recent Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                  5,
                  (index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            subtitle: Obx(() =>
                                walletController.isTransactionLoading.value
                                    ? SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ))
                                    : Text(walletController
                                        .transactions[index].transactionDate
                                        .toString())),
                            leading: Icon(
                              Icons.arrow_downward,
                              color: thirdColor,
                            ),
                            tileColor: Color.fromARGB(218, 237, 236, 236),
                            title: Obx(() =>
                                walletController.isTransactionLoading.value
                                    ? SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ))
                                    : Text(walletController
                                        .transactions[index].amount)),
                            trailing:
                                walletController.isTransactionLoading.value
                                    ? SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ))
                                    : Text(walletController
                                        .transactions[index].transactionType),
                          ),
                        ),
                      )),
            ),
          ))
        ],
      ),
    );
  }
}

//  // // await walletController.addMoneyToWallet(context);
                    // Get.toNamed('addmoneytowallet');
                      // await walletController.updateWalletForDeposit();