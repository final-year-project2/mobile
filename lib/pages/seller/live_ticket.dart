import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/active_ticket_controller.dart';
import 'package:frontend/controller/drawing_controller.dart';
import 'package:frontend/controller/live_ticket_controller.dart';
import 'package:frontend/controller/ticket_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class LiveTicket extends StatelessWidget {
  final controler = Get.find<LiveTicketController>();
  var buyers = 0000.0.obs;

  final activeTicketController = Get.find<ActiveTicketController>();
  // Rx? pointer = 10.0.obs;
  // double calculatePointer() {
  //   pointer?.value += 5;

  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // int? index = activeTicketController.index;

    return Scaffold(
      appBar: AppBar(
        title: Text('Live ticket'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      controler.isLoading.isTrue
                          ? activeTicketController
                              .tickets[activeTicketController.index ?? 0]
                              .numberOfTickets
                          : '${controler.ticketLeft}',
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
                        NeedlePointer(value: 20),
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
                )
              
            ),
            Container(height: size.height * 0.320),
            GestureDetector(
                onTap: () {
                  _showConfirmationDialog(context);
                  final controller = Get.find<Drawing>();
                  controller.getWinner();
                  // calculatePointer();

                  // controler.channel.ch
                  // controler.channel.sink.close();
                  // Disconnect the WebSocket
                  // WebSocketChannel channel;

                  // channel = WebSocketChannel.connect(Uri.parse(
                  //     'ws://10.0.2.2:8000/live_tickets/2')); // Reconnect the WebSocket
                },
                child: DefaultButton("Draw the ticket", false.obs,
                    colors: Colors.blue))
          ],
          //rgb(125, 90, 160)
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    print('Showing confirmation dialog');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(' Draw Ticket'),
          content: Text('Are you sure you want to draw the ticket?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Get.toNamed('/draw');
              },
              child: Container(
                  width: 70,
                  height: 40,
                  // decoration: BoxDecoration(
                  //     color: primaryColor,
                  //     borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Confirm',
                      // style: TextStyle(
                      //     color: blackColor, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }
}
