import 'dart:convert';

class CategoryPercentage {
  String category;
  double percentage;

  CategoryPercentage({
    required this.category,
    required this.percentage,
  });

  factory CategoryPercentage.fromJson(Map<String, dynamic> json) =>
      CategoryPercentage(
        category: json["category"],
        percentage: json["percentage"]?.toDouble(),
      );

  static List<CategoryPercentage> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => CategoryPercentage.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() => {
        "category": category,
        "percentage": percentage,
      };
}

class FrequentBuyer {
  String name;
  int ticketCount;

  FrequentBuyer({
    required this.name,
    required this.ticketCount,
  });

  factory FrequentBuyer.fromJson(Map<String, dynamic> json) => FrequentBuyer(
        name: json["name"],
        ticketCount: json["ticket_count"],
      );

  static List<FrequentBuyer> fromJsonList(List<dynamic> list) {
    return list.map((item) => FrequentBuyer.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "ticket_count": ticketCount,
      };
}
