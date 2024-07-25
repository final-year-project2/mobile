import 'package:flutter/material.dart';
import 'package:frontend/controller/user_ticket_controller.dart';
import 'package:get/get.dart';

class UserTickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool hasActiveTickets = true; // Replace with actual condition
    final int itemCount = 10; // Replace with actual item count
    final userTicketcontrller = Get.find<UserTicketController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Ticket',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Tickets',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.9,
              child: ListView.builder(
                itemCount: userTicketcontrller.tickets.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: size.height * 0.1,
                    child: GestureDetector(
                      onTap: () {
                        // Add your onTap logic here if needed
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ListTile(
                            // trailing: Container(
                            //   width: 40,
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       Text('live'),
                            //       Icon(
                            //         size: 15,
                            //         Icons.radio_button_checked_rounded,
                            //         color: Colors.green,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            title: Text(
                                'Ticket Title:${userTicketcontrller.tickets[index].ticketTitle}'), // Replace with actual title
                            subtitle: Text(
                              'Ticket Number:${userTicketcontrller.tickets[index].ticketNumber}', // Replace with actual ticket number
                              style:
                                  TextStyle(color: Colors.purple, fontSize: 11),
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
      ),
    );
  }
}
