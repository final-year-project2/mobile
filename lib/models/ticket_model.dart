import 'dart:convert';

String ticketsToJson(List<TicketModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketModel {
  dynamic seller;
  String title;
  String description;
  String numberOfTickets;
  String prizeCategories;
  String image1;
  dynamic image2;
  dynamic image3;

  TicketModel({
    required this.seller,
    required this.title,
    required this.description,
    required this.numberOfTickets,
    required this.prizeCategories,
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
              seller: item['seller'],
              title: item['title'],
              description: item["description"],
              numberOfTickets: item["number_of_tickets"],
              prizeCategories: item["prize_categories"],
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
        "image_1": image1,
        "image_2": image2,
        "image_3": image3,
      };
}