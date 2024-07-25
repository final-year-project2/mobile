import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/UserController.dart';
import 'package:frontend/controller/detail_controler.dart';
import 'package:frontend/controller/ticket_controller.dart';
import 'package:frontend/controller/wallet_controller.dart';
import 'package:frontend/widgets/PaynentPage.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:frontend/widgets/carousel.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});
  final controler = Get.find<DetailControler>();
  final Walletcontroler = Get.find<WalletController>();
  TextEditingController CommentControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controler.GetPurchaseTicketNo();
    controler.getComment();

    List TicketImage = [];
    // to write the comment
    void WritenComment(String comment) {
      controler.SetComment(comment);
      CommentControler.text = '';
    }

    print('wallet cotroler');
    print(controler.Ticket['id']);
    print(Walletcontroler.walletAmount);
    TicketImage = [
      controler.Ticket['image1'],
      controler.Ticket['image2'],
      controler.Ticket['image3']
    ];

    List FotterData = [
      {
        "icon": Icons.delivery_dining,
        "title": "Delivery",
        "description": "we deliver your prize"
      },
      {
        "icon": Icons.security,
        "title": "Trust",
        "description": "Your money is safe with us"
      },
      {
        "icon": Icons.celebration,
        "title": "Win",
        "description": "play in our platform and win a prize you want"
      }
    ];

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
                color: Color.fromRGBO(222, 216, 225, 1),
                // color: Color.fromRGBO(216, 210, 220, 1),
                // color: Color.fromRGBO(255, 251, 245, 1),
                // rgb(195, 172, 208)

                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price ${controler.Ticket['price_of_ticket']} Birr",
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${controler.Ticket['numberOfTickets']} Tickets",
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "purchase lead to winner",
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          CircularPercentIndicator(
            radius: 50,
            // rgb(255, 251, 245)
            progressColor: Color.fromRGBO(195, 172, 208, 1),
            // backgroundColor: Color.fromRGBO(255, 251, 245, 1),
            backgroundColor: Color.fromRGBO(171, 125, 255, 1),
            // rgb(119, 67, 219)
            // rgb(195, 172, 208)
// Color.fromRGBO(255, 251, 245, 1),
            animation: true,
            lineWidth: 12,
            animationDuration: 2000,
            percent: 0.7,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              '${controler.Ticket['numberOfTickets']}',
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
            onTap: () {
              // controler.purchasedTicketList.value = [];F

              Get.bottomSheet(
                  backgroundColor: whiteColor,
                  isScrollControlled: true,
                  Container(
                    height: screenSize.height * 0.90,
                    child: PaymentPage(
                        controler,
                        controler.Ticket['numberOfTickets'],
                        context,
                        screenSize,
                        Walletcontroler),
                  ));
            },
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
                    child: Container(
                      width: screenSize.width,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => Expanded(
                                child: controler.TicketCommentList.length == 0
                                    ? Center(
                                        child: Text('No comment '),
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            controler.TicketCommentList.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.person_2_outlined,
                                                    color: thirdColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            homePageContainerBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${controler.TicketCommentList[index].userId}",
                                                          style: TextStyle(
                                                              color:
                                                                  optionalgrayTextColor),
                                                        ),
                                                        Text(
                                                          controler
                                                              .TicketCommentList[
                                                                  index]
                                                              .comment,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100,
                                                              fontSize: 13,
                                                              color:
                                                                  homePageBannerColor),
                                                        )
                                                      ],
                                                    ),
                                                  ))
                                                ],
                                              )
                                            ],
                                          );
                                        },
                                      )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: homePageContainerBackground,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  CustomForm(
                                    editingController: CommentControler,
                                    hintText: 'write your coment',
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                      onTap: () =>
                                          WritenComment(CommentControler.text),
                                      child: Icon(
                                        Icons.send,
                                        color: homePageBannerColor2,
                                      ))
                                ],
                              )),
                        ],
                      ),
                    ))),
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
                // Padding(
                //   padding: const EdgeInsets.only(right: 10),
                //   child: FilledButton(
                //     style: ButtonStyle(
                //       backgroundColor:
                //           MaterialStateProperty.all<Color>(secondaryColor),
                //     ),
                //     onPressed: () => Get.bottomSheet(
                //         backgroundColor: whiteColor,
                //         isScrollControlled: true,
                //         Container(
                //           height: screenSize.height * 0.9,
                //           child: PaymentPage(
                //               controler,
                //               controler.Ticket['numberOfTickets'],
                //               context,
                //               screenSize,
                //               Walletcontroler),
                //         )),
                //     child: Text(
                //       'Buy ticket',
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
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
                                style: TextStyle(
                                    color: Color.fromRGBO(100, 100, 100, 1)),
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
                        color: Color.fromRGBO(195, 172, 208, 1),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      controler.Ticket['description'] ?? "",
                      style: TextStyle(
                        color: blackColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 30),
                    child: Column(
                      children: FotterData.map((elements) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                elements["icon"],
                                size: 50,
                                color: grayTextColor,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(elements["title"]),
                                    Text(elements["description"]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    HorizontalLine(height: 1, width: 100),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
