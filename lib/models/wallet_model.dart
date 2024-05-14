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

class TransactionModel {
  String amount;
  String transactionType;
  DateTime transactionDate;
  double walletBalance;

  TransactionModel({
    required this.amount,
    required this.transactionType,
    required this.transactionDate,
    required this.walletBalance,
  });
  static List<TransactionModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((item) => TransactionModel(
              amount: item['amount'],
              transactionType:item['transaction_type'],
                
              transactionDate: DateTime.parse(item['transaction_date']),
              walletBalance: item['wallet_balance'],
            ))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "transaction_type": transactionTypeValues.reverse[transactionType],
        "transaction_date": transactionDate.toIso8601String(),
        "wallet_balance": walletBalance,
      };
}

enum TransactionType { DEPOSIT, WITHDRAWAL }

final transactionTypeValues = EnumValues({
  "deposit": TransactionType.DEPOSIT,
  "withdrawal": TransactionType.WITHDRAWAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
