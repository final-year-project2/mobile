import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/active_ticket_controller.dart';
import 'package:frontend/controller/drawing_controller.dart';
import 'package:frontend/widgets/gradiant.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_countdown/slide_countdown.dart';

class DrawTicket extends StatelessWidget {
  // const DrawTicket({super.key});
  final activeTicketController = Get.find<ActiveTicketController>();
  final Future<void> _delayedFuture = Future.delayed(Duration(seconds: 8));
  final drawingController = Get.find<Drawing>();

  @override
  Widget build(BuildContext context) {
    RxBool isWinnerKnown = false.obs;
    RxBool showAnimation = false.obs;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          // ( drawingController.winner.i || drawingController.winner)==null ?
          return Stack(
            children: [
              Positioned(
                child: showAnimation.value == true
                    ? Visibility(
                        visible: showAnimation.value,
                        child: Lottie.asset(
                          'assets/fire.json',
                          animate: true,
                          backgroundLoading: true,
                        ),
                      )
                    : Text(''),
                // Obx(){

                // }
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   'The Winner is...',
                  //   style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                  // )
                  //
                  // i,

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GradientText(
                      'Winner will be Announced In ...',
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(119, 228, 200, 1), // #77E4C8
                          Color.fromRGBO(54, 194, 206, 1), // #36C2CE
                          Color.fromRGBO(71, 140, 207, 1), // #478CCF
                          Color.fromRGBO(69, 53, 193, 1), // RGB: 240, 240, 240

                          // Color.fromRGBO(134, 140, 2, 1), // Start color
                          // Add more colors to the gradient if desired
                        ],
                      ),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 20, 50, 25),
                    child: SlideCountdownSeparated(
                      onDone: () {
                        isWinnerKnown.value = true;
                        Timer(Duration(seconds: 1), () {
                          showAnimation.value = true;
                        });
                        Timer(Duration(seconds: 6), () {
                          showAnimation.value = false;
                        });
                      },
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(119, 228, 200, 1), // #77E4C8
                              Color.fromRGBO(54, 194, 206, 1), // #36C2CE
                              Color.fromRGBO(71, 140, 207, 1), // #478CCF
                              // Color.fromRGBO(69, 53, 193, 1) // #4535C1
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(71, 140, 207, 1), // #478CCF
                          )),
                      style: TextStyle(
                          fontSize: 150,
                          fontWeight: FontWeight.bold,
                          color: whiteColor),
                      // suffixIcon: Icon(Icons.add),

                      duration: Duration(seconds: 10),
                    ),
                  ),

                  GradientText(
                    'Seconds',
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(119, 228, 200, 1), // #77E4C8
                        Color.fromRGBO(54, 194, 206, 1), // #36C2CE
                        Color.fromRGBO(71, 140, 207, 1), // #478CCF
                        Color.fromRGBO(69, 53, 193, 1), // RGB: 240, 240, 240
                        Color.fromRGBO(52, 30, 225, 1), // RGB: 240, 240, 240

                        // Color.fromRGBO(134, 140, 2, 1), // Start color
                        // Add more colors to the gradient if desired
                      ],
                    ),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  // isWinnerKnown.value == true

                  isWinnerKnown.value == true
                      ? Container(
                          height: 100,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: ListTile(
                                isThreeLine: true,
                                trailing: Container(
                                  width: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Won'),
                                      Icon(
                                        size: 15,
                                        Icons.radio_button_checked_rounded,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    GradientText(
                                      'Winner :- ${drawingController.winner?.winnerName}',
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(
                                              119, 228, 200, 1), // #77E4C8
                                          Color.fromRGBO(
                                              54, 194, 206, 1), // #36C2CE
                                          Color.fromRGBO(
                                              71, 140, 207, 1), // #478CCF
                                          Color.fromRGBO(69, 53, 193,
                                              1), // RGB: 240, 240, 240

                                          // Color.fromRGBO(134, 140, 2, 1), // Start color
                                          // Add more colors to the gradient if desired
                                        ],
                                      ),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GradientText(
                                      '',
                                      // '${drawingController.winner?.winnerName}',
                                      gradient: LinearGradient(
                                        colors: [
                                          // Color.fromRGBO(119, 228, 200, 1), // #77E4C8
                                          Color.fromRGBO(
                                              71, 140, 207, 1), // #478CCF
                                          Color.fromRGBO(69, 53, 193, 1),
                                          Color.fromRGBO(
                                              54, 194, 206, 1), // #36C2CE
                                          Color.fromRGBO(
                                              71, 140, 207, 1), // #478CCF
                                          Color.fromRGBO(69, 53, 193,
                                              1), // RGB: 240, 240, 240

                                          // Color.fromRGBO(134, 140, 2, 1), // Start color
                                          // Add more colors to the gradient if desired
                                        ],
                                      ),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                subtitle: GradientText(
                                  // '',
                                  'Winning Number: ${drawingController.winner?.winnerTicketNumber}',
                                  gradient: LinearGradient(
                                    colors: [
                                      // Color.fromRGBO(119, 228, 200, 1), // #77E4C8
                                      // Color.fromRGBO(71, 140, 207, 1), // #478CCF
                                      // Color.fromRGBO(69, 53, 193, 1),
                                      // Color.fromRGBO(54, 194, 206, 1), // #36C2CE
                                      Color.fromRGBO(
                                          71, 140, 207, 1), // #478CCF
                                      Color.fromRGBO(
                                          69, 53, 193, 1), // RGB: 240, 240, 240

                                      // Color.fromRGBO(134, 140, 2, 1), // Start color
                                      // Add more colors to the gradient if desired
                                    ],
                                  ),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Text('')
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
