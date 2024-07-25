class UserTicket {
  final String ticketTitle;
  final String ticketNumber;
  final String sellerName;

  UserTicket(
      {required this.ticketTitle,
      required this.ticketNumber,
      required this.sellerName});

  factory UserTicket.fromJson(Map<String, dynamic> json) {
    return UserTicket(
      ticketTitle: json['ticket_title'] ?? '',
      ticketNumber: json['ticket_number'] ?? '',
      sellerName: json['seller_name'] ?? '',
    );
  }
  static List<UserTicket> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => UserTicket.fromJson(item)).toList();
  }
}
