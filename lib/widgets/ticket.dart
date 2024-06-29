import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/widgets/layout.dart';

Widget Ticket(
    {String? title,
    String? ticketLeft,
    String? totalTicket,
    String? numberOfBuyers,
    String? successfulCampaign,
    String? sellerName,
    String? imageUri,
    double? progessValue}) {
  return Container(
      width: 400,
      height: 165,
      decoration: BoxDecoration(
          color: homePageContainerBackground,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(),
            width: 130,
            height: 165,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(0),
                topLeft: Radius.circular(10),
              ),
              child: Image.network(
                  fit: BoxFit.cover,
                  // scale: 0.9,
                  imageUri ?? 'assets/a.jpg'),
            ),
          ),
          SizedBox(
            height: 180,
            width: 260,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment:
                // MainAxisAlignment.center,
                children: [
                  Text(
                    maxLines: 3,
                    softWrap: true,
                    title ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: ticketLeft,
                        style: GoogleFonts.poppins(
                            fontSize: 11, color: primaryColor)),
                    TextSpan(
                        text: " Tickets Left",
                        style: GoogleFonts.poppins(
                            fontSize: 11, color: subTextColor))
                  ])),
                  VerticalSpace(20),
                  LinearProgressIndicator(
                    value: progessValue,
                    minHeight: 7,
                    backgroundColor: progressBackground,
                    borderRadius: BorderRadius.circular(5),
                    color: progressColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0',
                          style: GoogleFonts.poppins(
                              color: subTextColor, fontSize: 9)),
                      Row(
                        children: [
                          Text(
                            totalTicket ?? '',
                            style: GoogleFonts.poppins(
                                color: subTextColor, fontSize: 9),
                          ),
                          Text(
                            ' Tickets',
                            style: GoogleFonts.poppins(
                              // fontWeight: FontWeight.bold,
                              color: subTextColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: numberOfBuyers,
                        style: GoogleFonts.poppins(
                            fontSize: 11, color: progressColor)),
                    TextSpan(
                        text: " People bought this  ticket",
                        style: GoogleFonts.poppins(
                            fontSize: 11, color: blackColor))
                  ])),
                  VerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                            3,
                            (index) => const Icon(
                                  Icons.star,
                                  color: primaryColor,
                                  size: 17,
                                )),
                      ),
                      HorizontalSpace(10),
                      Row(
                        children: [
                          Text(
                            successfulCampaign ?? '',
                            style: TextStyle(fontSize: 10),
                          ),
                          HorizontalSpace(5),
                          Text(
                            'Successful campaign  ',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                  VerticalSpace(10),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Icon(Icons.account_circle),
                      Text(
                        sellerName ?? '',
                        style: TextStyle(fontSize: 11, color: thirdColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ));
}
