import 'dart:convert';

String ticketsToJson(List<TicketModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketModel {
  int id;
  dynamic seller;
  String title;
  String description;
  String numberOfTickets;
  String prizeCategories;
  String price_of_ticket;
  String image1;
  dynamic image2;
  dynamic image3;

  TicketModel({

    required this.id,
    required this.seller,
    required this.id,
    required this.title,
    required this.description,
    required this.numberOfTickets,
    required this.prizeCategories,
    required this.price_of_ticket,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  // factory TicketModel.fromJson(Map<String, dynamic> json) => Ticket
  //       prizeCategories: json["prize_categories"],
  //       image1: json["image_1"],
  //       image2: json["image_2"],
  //       image3: json["image_3"],
  //     );
  static List<TicketModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((item) => TicketModel(
              id: item['id'],
              seller: item['seller'],
              title: item['title'],
              description: item["description"],
              numberOfTickets: item["number_of_tickets"],
              prizeCategories: item["prize_categories"],
              price_of_ticket: item["price_of_ticket"],
              image1: item["image_1"],
              image2: item["image_2"],
              image3: item["image_3"],
            ))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        "seller": seller,
        "title": title,
        "description": description,
        "number_of_tickets": numberOfTickets,
        "prize_categories": prizeCategories,
        "price_of_ticket": price_of_ticket,
        "image_1": image1,
        "image_2": image2,
        "image_3": image3,
      };
}
