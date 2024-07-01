import 'dart:convert';

List<PurchasedTicketModel> purchasedTicketModelFromJson(String str) => List<PurchasedTicketModel>.from(json.decode(str).map((x) => PurchasedTicketModel.fromJsonList(x)));

// String purchasedTicketModelToJson(List<PurchasedTicketModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchasedTicketModel {
    int id;
    int User_id;
    int Ticket_id;
    String Ticket_number;

    PurchasedTicketModel({
        required this.id,
        required this.User_id,
        required this.Ticket_id,
        required this.Ticket_number,
    });

    // factory PurchasedTicketModel.fromJson(Map<String, dynamic> json) => PurchasedTicketModel(
    //     id: json["id"],
    //     userId: json["User_id"],
    //     ticketId: json["Ticket_id"],
    //     ticketNumber: json["Ticket_number"],
    // );


  static List<PurchasedTicketModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((item) => PurchasedTicketModel(
              id: item['id'],
              User_id: item['User_id'],
              Ticket_id: item["Ticket_id"],
              Ticket_number: item["Ticket_number"],
            ))
        .toList();
  }
    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "User_id": userId,
    //     "Ticket_id": ticketId,
    //     "Ticket_number": ticketNumber,
    // };
}