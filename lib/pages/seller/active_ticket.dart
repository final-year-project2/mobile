import 'package:flutter/material.dart';
import 'package:frontend/controller/active_ticket_controller.dart';
import 'package:frontend/controller/drawing_controller.dart';
import 'package:frontend/controller/live_ticket_controller.dart';
import 'package:frontend/controller/sellerController.dart';
import 'package:get/get.dart';

class ActiveTickets extends StatelessWidget {
  final sellerController = Get.find<SellerController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final activeTicketController = Get.find<ActiveTicketController>();

    final liveTicketController = Get.find<LiveTicketController>();

    final drawingContrller = Get.find<Drawing>();

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'YOURTICKET'.tr,
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if(activeTicketController.is)
              activeTicketController.isLoading.value
                  ? Center(
                      child: Container(
                          margin: EdgeInsetsDirectional.only(top: 400),
                          child: CircularProgressIndicator()),
                    )
                  : activeTicketController.tickets.isEmpty
                      ? Column(
                          children: [
                            Center(
                              child: Image.asset('assets/nodata.png'),
                            ),
                            Text(
                              'No active ticket yet',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      : Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'YOURTICKET'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                            ),
                            Container(
                              width: size.width,
                              height: size.height * 0.9,
                              child: ListView.builder(
                                itemCount:
                                    activeTicketController.tickets.length,
                                // itemCount: ,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: size.height * 0.1,
                                    child: GestureDetector(
                                      onTap: () {
                                        //go to live ticket page
                                        print(
                                            'seller_id :${sellerController.sellerId}');
                                        // liveTicketController.numberOfBuyer
                                        activeTicketController.index = index;

                                        activeTicketController.ticketId =
                                            activeTicketController
                                                .tickets[index].id;

                                        // drawingContrller.getWinner(
                                        //     activeTicketController
                                        //         .tickets[index].id
                                        //         .toString());

                                        // print(
                                        //     'Ticket_id_is:${activeTicketController.ticketId}');
                                        // liveTicketController
                                        //     .numberOfBuyer.value = 0;
                                        // liveTicketController.ticketLeft.value =
                                        //     0;

                                        Get.toNamed('/liveticket');
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: ListTile(
                                            trailing: Container(
                                              width: 40,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text('live'),
                                                  Icon(
                                                    size: 15,
                                                    Icons
                                                        .radio_button_checked_rounded,
                                                    color: Colors.green,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            leading: Image.network(
                                              activeTicketController
                                                  .tickets[index].image1,
                                              // fit: BoxFit.fitWidth,

                                              height: 100,
                                              width: 100,

                                              // color: blureGreen,
                                            ),
                                            title: Text(activeTicketController
                                                .tickets[index].title),
                                            subtitle: Text(
                                              activeTicketController
                                                  .tickets[index].priceOfTicket,
                                              style: TextStyle(
                                                  color: Colors.purple,
                                                  fontSize: 11),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
            ],
          ),
        ),
      );
    });
  }
}
