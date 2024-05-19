import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/detail_controler.dart';
import 'package:frontend/widgets/PaynentPage.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:frontend/widgets/carousel.dart';
class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controler = Get.find<DetailControler>();
  
  @override
  Widget build(BuildContext context) {
  var Ticket = Get.arguments;
  List TicketImage = [Ticket.image1,Ticket.image2,Ticket.image3];

  final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
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
                onPressed: ()=>Get.bottomSheet(
                              backgroundColor: whiteColor,
                              isScrollControlled: true,
                              Container(
                              height: screenSize.height*0.9,
                              child: PaymentPage(controler),
                            )),
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
                        color: Color.fromARGB(255, 185, 180, 180).withOpacity(0.5),
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
                          '   ${Ticket.title.substring(0,min<int>(25,Ticket.title.length))} ...',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: grayTextColor,),
                                overflow: TextOverflow.clip,
                          ),
                          Text(Ticket.prizeCategories,style: TextStyle(
                            color: thirdColor
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: blackBackground,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Price 10 Birr",style: TextStyle(
                                      color: darklight,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    SizedBox(height: 5,),
                                    Text("20 Tickets sold",style: TextStyle(
                                      color: darklight,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    SizedBox(height: 5,),
                                    Text("10 Tickets remains",style: TextStyle(
                                      color: darklight,
                                      fontWeight: FontWeight.bold,
                                    ),),
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
                                center: Text('20',style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 15,
                          ),



                          GestureDetector(
                            onTap: ()=>Get.bottomSheet(
                              backgroundColor: whiteColor,
                              isScrollControlled: true,
                              Container(
                              height: screenSize.height*0.9,
                              child: PaymentPage(controler),
                            )),
                            child: DefaultButton("Buy Ticket", false.obs)),



                          SizedBox(
                            height: 5,
                          ),
                          DefaultButton("Share Ticket", false.obs),
                          SizedBox(
                            height: 15,
                          ),
                        ],
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
                        "${Ticket.seller}",
                        style: TextStyle(
                            color: grayTextColor, fontWeight: FontWeight.bold),
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
                        color: Color.fromARGB(255, 185, 180, 180).withOpacity(0.5),
                        blurRadius: 3, // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(Ticket.description ?? "",
                  style: TextStyle(color: blackColor),
                ),
              ),


              SizedBox(
                height: 10,
              ),
              // Text(
              //   'Comments ${controler.coments.length}',
              //   style: TextStyle(
              //       color: grayTextColor, fontWeight: FontWeight.bold),
              // ),
              // Row(
              //   children: [
              //     Container(
              //         margin: EdgeInsets.fromLTRB(20, 3, 5, 10),
              //         decoration: BoxDecoration(
              //             color: homePageContainerBackground,
              //             borderRadius: BorderRadius.circular(5)),
              //         child: CustomForm(hintText: 'Write comment')),
              //     Icon(
              //       Icons.send,
              //       size: 40,
              //       color: secondaryColor,
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Column(
              //   children: controler.coments
              //       .map((items) => Column(
              //             children: [
              //               Container(
              //                 margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              //                 padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
              //                 decoration: BoxDecoration(
              //                     color: homePageContainerBackground),
              //                 child: Column(
              //                   children: [
              //                     Row(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                       children: [
              //                         Icon(
              //                           Icons.person_2_outlined,
              //                           color: secondaryColor,
              //                         ),
              //                         SizedBox(
              //                           width: 10,
              //                         ),
              //                         Text('Mandela .com'),
              //                         Text(
              //                           '  1hr ago',
              //                           style: TextStyle(
              //                               fontSize: 10, color: primaryColor),
              //                         )
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: 15,
              //                     ),
              //                     Text(
              //                       "$items",
              //                       style: TextStyle(
              //                           fontSize: 13, color: grayTextColor),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               Container(
              //                 padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
              //                 margin: EdgeInsets.only(left: 50, bottom: 15),
              //                 decoration: BoxDecoration(
              //                     color: homePageContainerBackground),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       'Replay from ticket owner',
              //                       style: TextStyle(color: secondaryColor),
              //                     ),
              //                     Text(
              //                       '$items',
              //                       style: TextStyle(
              //                           fontSize: 13, color: grayTextColor),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
              //                 child: Divider(
              //                   height: 0,
              //                   color: grayTextColor,
              //                 ),
              //               ),
              //             ],
              //           ))
              //       .toList(),
              // )
            ],
          ),
        ),
      ],
    ));
  }
}
