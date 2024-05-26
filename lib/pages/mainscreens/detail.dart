import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/detail_controler.dart';
import 'package:frontend/controller/wallet_controller.dart';
import 'package:frontend/widgets/PaynentPage.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:frontend/widgets/carousel.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});
  final controler = Get.find<DetailControler>();
  final Walletcontroler = Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    List TicketImage = [];

    print('wallet cotroler');
    print(Walletcontroler.walletAmount);
    TicketImage = [
      controler.Ticket['image1'],
      controler.Ticket['image2'],
      controler.Ticket['image3']
    ];
    controler.GetPurchaseTicketNo();

    final screenSize = MediaQuery.of(context).size;
    var children = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: blackBackground,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price 10 Birr",
                  style: TextStyle(
                    color: darklight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "20 Tickets sold",
                  style: TextStyle(
                    color: darklight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "10 Tickets remains",
                  style: TextStyle(
                    color: darklight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          CircularPercentIndicator(
            radius: 50,
            progressColor: thirdColor,
            backgroundColor: blureGreen,
            animation: true,
            lineWidth: 12,
            animationDuration: 2000,
            percent: 0.7,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              '20',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 15,
      ),
      Obx(
        () => GestureDetector(
            onTap: () => Get.bottomSheet(
                backgroundColor: whiteColor,
                isScrollControlled: true,
                Container(
                  height: screenSize.height * 0.9,
                  child: PaymentPage(controler,
                      controler.Ticket['numberOfTickets'], context, screenSize,Walletcontroler),
                )),
            child: controler.isPending.value
                ? CircularProgressIndicator(
                    color: primaryColor,
                  )
                : DefaultButton("Buy Ticket", false.obs)),
      ),
      SizedBox(
        height: 5,
      ),
      DefaultButton("Share Ticket", false.obs),
      SizedBox(
        height: 15,
      ),
    ];
    return Scaffold(
        backgroundColor: Color(0xFFF4F5F9),
        floatingActionButton: GestureDetector(
            onTap: () => Get.bottomSheet(
                backgroundColor: whiteColor,
                isScrollControlled: true,
                Container(
                  height: screenSize.height * 0.7,
                  child: Center(
                    child: Text('No available comments'),
                  ),
                )),
            child: Container(
              width: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(
                    Icons.message_outlined,
                    color: whiteColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Comments',
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: primaryColor,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                  size: 30,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(secondaryColor),
                    ),
                    onPressed: () => {},
                    // Get.bottomSheet(
                    //               backgroundColor: whiteColor,
                    //               isScrollControlled: true,
                    //               Container(
                    //               height: screenSize.height*0.9,
                    //               child: PaymentPage(controler),
                    //             )),
                    child: Text(
                      'Buy ticket',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.bookmark_add,
                    size: 30,
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.share,
                    size: 30,
                    color: blackColor,
                  ),
                ),
              ],
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Stack(children: [
                  CarouselWidjit(
                    item: TicketImage,
                  ),
                ]),
              )),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 185, 180, 180)
                                .withOpacity(0.5),
                            blurRadius: 8, // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '   ${controler.Ticket['title'].substring(0, min<int>(25, controler.Ticket['title'].length))} ...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: grayTextColor,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                              Text(
                                controler.Ticket['prizeCategories'],
                                style: TextStyle(color: thirdColor),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: children,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.person,
                        size: 40,
                        color: thirdColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "${controler.Ticket['seller']}",
                            style: TextStyle(
                                color: grayTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Mandela .com',
                            style: TextStyle(color: grayTextColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      height: 20,
                      thickness: 0.3,
                      color: grayTextColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: homePageContainerBackground,
                        boxShadow: [
                          BoxShadow(
                            color: grayTextColor.withOpacity(0.5),
                            blurRadius: 1, // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      controler.Ticket['description'] ?? "",
                      style: TextStyle(color: blackColor),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
