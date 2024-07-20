import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/live_ticket_controller.dart';
import 'package:frontend/controller/ticket_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LiveTicket extends StatelessWidget {
  final controler = Get.find<LiveTicketController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Live ticket'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack(
            //   clipBehavior: Clip.none,
            //   children: [
            //     Container(
            //       height: 180,
            //       width: size.width,
            //       decoration: BoxDecoration(
            //           gradient: SweepGradient(
            //             colors: <Color>[Colors.lightGreen, Colors.blue],
            //             stops: <double>[1.0, 0.0],
            //           ),
            //           borderRadius: BorderRadius.only(
            //               bottomLeft: Radius.circular(50),
            //               bottomRight: Radius.circular(50))),
            //     ),
            //     Positioned(
            //       left: 39,
            //       bottom: -60,
            //       child: Stack(clipBehavior: Clip.none, children: [
            //         Container(
            //           height: size.width * 0.37,
            //           width: size.width * 0.8,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(15),
            //               color: Colors.lightGreen,
            //               gradient: SweepGradient(
            //                 colors: <Color>[Colors.lightGreen, Colors.blue],
            //                 stops: <double>[0.0, 1.0],
            //               )),
            //         ),
            //         Positioned(
            //             top: 10,
            //             left: 0,
            //             child: Container(
            //               width: size.width * 0.8,
            //               child: Column(
            //                 children: [
            //                   Text(
            //                     'Ticket Left',
            //                     style:
            //                         TextStyle(color: whiteColor, fontSize: 22),
            //                   ),
            //                   VerticalSpace(15),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       HorizontalSpace(5),
            //                       Image.asset(width: 35, 'assets/birr2.png')
            //                     ],
            //                   )
            //                 ],
            //               ),
            //             ))
            //       ]),
            //     )
            //   ],
            // ),
            Container(
              height: size.height * 0.11,
              width: size.width,
              decoration: BoxDecoration(
                  // color: Color.fromRGBO(125, 90, 160, 1),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return Text(
                      '${controler.ticketLeft}',
                      style: TextStyle(fontSize: 50, color: blackBackground),
                    );
                  }),
                  HorizontalSpace(10),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      'Ticket left',
                      style: TextStyle(fontSize: 30, color: blackColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  // color: Color.fromRGBO(125, 90, 160, 1),
                  ),
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        // startWidth:1
                        startValue: 0,
                        endValue: 100,
                        color: Colors.lightGreen,
                        gradient: SweepGradient(
                          colors: <Color>[Colors.lightGreen, Colors.blue],
                          stops: <double>[0.0, 1.0],
                        ),
                        startWidth: 15,
                        endWidth: 15,
                      ),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: 45,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            'Buyers reached',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: EdgeInsets.only(top: 100),
                        ),
                        positionFactor: 0.5,
                        angle: 90,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(height: size.height * 0.320),
            DefaultButton("Draw the ticket", false.obs, colors: Colors.blue)
          ],
          //rgb(125, 90, 160)
        ),
      ),
    );
  }
}
