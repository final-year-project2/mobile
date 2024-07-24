// import 'dart:convert';

// String ticketsToJson(List<TicketModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class TicketModel {
//   int id;
//   dynamic seller;
//   String title;
//   String description;
//   String numberOfTickets;
//   String prizeCategories;
//   String image1;
//   dynamic image2;
//   dynamic image3;

//   TicketModel({
//     required this.seller,
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.numberOfTickets,
//     required this.prizeCategories,
//     required this.image1,
//     required this.image2,
//     required this.image3,
//   });

//   // factory TicketModel.fromJson(Map<String, dynamic> json) => Ticket
//   //       prizeCategories: json["prize_categories"],
//   //       image1: json["image_1"],
//   //       image2: json["image_2"],
//   //       image3: json["image_3"],
//   //     );
//   static List<TicketModel> fromJsonList(List<dynamic> jsonList) {
//     return jsonList
//         .map((item) => TicketModel(
//               id: item['id'],
//               seller: item['seller'],
//               title: item['title'],
//               description: item["description"],
//               numberOfTickets: item["number_of_tickets"].toString(),
//               prizeCategories: item["prize_categories"].toString(),
//               image1: item["image_1"],
//               image2: item["image_2"],
//               image3: item["image_3"],
//             ))
//         .toList();
//   }

//   Map<String, dynamic> toJson() => {
//         "seller": seller,
//         "title": title,
//         "description": description,
//         "number_of_tickets": numberOfTickets,
//         "prize_categories": prizeCategories,
//         "image_1": image1,
//         "image_2": image2,
//         "image_3": image3,
//       };
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class ResponseModel {
  final int count;
  final String next;
  final String previous;
  final List<TicketModel> results;

  ResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<TicketModel> resultsList =
        list.map((i) => TicketModel.fromJson(i)).toList();

    return ResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: resultsList,
    );
  }
}

class TicketModel {
  final int id;
  final int seller;
  final String title;
  final String description;
  final String numberOfTickets;
  final String prizeCategories;
  final String priceOfTicket;
  final String image1;
  final String? image2;
  final String? image3;
  final int numberOfBuyer;
  final int ticketLeft;
  final bool winner_drawn;

  TicketModel(
      {required this.id,
      required this.seller,
      required this.title,
      required this.description,
      required this.numberOfTickets,
      required this.prizeCategories,
      required this.priceOfTicket,
      required this.image1,
      this.image2,
      this.image3,
      required this.numberOfBuyer,
      required this.ticketLeft,
      required this.winner_drawn});

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      winner_drawn: json['winner_drawn'],
      id: json['id'] ?? 0,
      seller: json['seller'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      numberOfTickets: json['number_of_tickets']?.toString() ?? '0',
      prizeCategories: json['prize_categories']?.toString() ?? '',
      priceOfTicket: json['price_of_ticket']?.toString() ?? '0.0',
      image1: json['image_1'] ?? '',
      image2: json['image_2'] ?? null,
      image3: json['image_3'] ?? null,
      numberOfBuyer: json['number_of_buyer'] ?? 0,
      ticketLeft: json['ticket_left'] ?? 0,
    );
  }

  static List<TicketModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => TicketModel.fromJson(item)).toList();
  }
}
