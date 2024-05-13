import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class WalletModel {
  int id;
  String balance;
  int user;

  WalletModel({
    required this.id,
    required this.balance,
    required this.user,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        id: json["id"],
        balance: json["balance"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
        "user": user,
      };
}
