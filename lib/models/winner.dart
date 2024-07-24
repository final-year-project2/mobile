// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

WinnerModel welcomeFromJson(String str) =>
    WinnerModel.fromJson(json.decode(str));

String welcomeToJson(WinnerModel data) => json.encode(data.toJson());

class WinnerModel {
  String status;
  String message;
  String winnerTicketNumber;
  String winnerName;

  WinnerModel({
    required this.status,
    required this.message,
    required this.winnerTicketNumber,
    required this.winnerName,
  });

  factory WinnerModel.fromJson(Map<String, dynamic> json) => WinnerModel(
      status: json["status"],
      message: json["message"],
      winnerTicketNumber: json["winner_ticket_number"],
      winnerName: json["winner_name"]);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "winner_ticket_number": winnerTicketNumber,
      };
}
