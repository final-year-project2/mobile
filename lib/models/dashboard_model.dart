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
