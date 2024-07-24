import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';

Widget PaymentPage(final controler, String NoOfTicket, final context,
    final screenSize, final Walletcontroler) {
  return SingleChildScrollView(
    child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
        child: Obx(() {
          int ticketPrice = int.parse(controler.Ticket['price_of_ticket']);
          int totalCost = controler.SellectedTicketNo.length * ticketPrice;
          double walletPrice = double.parse(Walletcontroler.walletAmount.value);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wallet,
                              color: thirdColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close,
                              color: blackColor,
                              size: 25,
                              weight: 30,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 150,
                width: screenSize.width,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: darklight, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '${controler.Ticket['price_of_ticket']} Birr',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                color: blackColor),
                          ),
                        ),
                        Text(
                          '10 Ticket Remain ',
                          style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 130,
                      child: Lottie.asset(
                        'assets/payment.json',
                        animate: true,
                        repeat: false,
                        backgroundLoading: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      'Select Ticket No',
                      style: TextStyle(
                          color: grayTextColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Text('${controler.SellectedTicketNo.length}'),
                      Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: primaryColor,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 280,
                child: GridView.builder(
                    itemCount: int.parse(NoOfTicket),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () =>
                              controler.purchasedTicketList.contains(index + 1)
                                  ? ''
                                  : controler.AddRemoveTicket(index + 1),
                          child: Container(
                            decoration: BoxDecoration(
                                color: controler.SellectedTicketNo.contains(
                                        index + 1)
                                    ? thirdColor
                                    : progressBackground,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: controler.purchasedTicketList
                                      .contains(index + 1)
                                  ? Text(
                                      'Sold',
                                      style: TextStyle(
                                          color: redColore,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text('${index + 1}'),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                '$totalCost',
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Birr Tottal',
                                style: TextStyle(color: whiteColor),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Payment method',
                              style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => controler.changePaymentType(),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    decoration: BoxDecoration(
                                        color: controler.PaymentType ==
                                                "from_wallet"
                                            ? thirdColor
                                            : whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Wallet',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.wallet)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  decoration: BoxDecoration(
                                      color:
                                          controler.PaymentType == "from_chapa"
                                              ? thirdColor
                                              : whiteColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: GestureDetector(
                                    onTap: () => controler.changePaymentType(),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Chapa',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.home_outlined)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controler.PaymentType == "from_chapa") {
                          controler.pay(context);
                        } else {
                          Get.bottomSheet(
                              backgroundColor: whiteColor,
                              isScrollControlled: true,
                              Container(
                                height: screenSize.height * 0.30,
                                width: screenSize.width,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.card_giftcard,
                                      size: 100,
                                      color: thirdColor,
                                    ),
                                    Text(
                                      '${controler.SellectedTicketNo.length} Tickets',
                                      style: TextStyle(
                                          color: grayTextColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${totalCost} Birr From your wallet',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //
                                    if (walletPrice >= totalCost)
                                      GestureDetector(
                                        onTap: () =>
                                            controler.callPurchaseTicket(),
                                        child:
                                            DefaultButton("Confirm", false.obs),
                                      ),
                                    if (walletPrice < totalCost)
                                      Text('insuffiecient Amount ')
                                  ],
                                ),
                              ));
                        }
                      },
                      child: Center(
                        child: DefaultButton("Pay", false.obs),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        })),
  );
}
