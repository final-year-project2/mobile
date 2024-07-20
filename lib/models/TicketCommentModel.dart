import 'dart:convert';

// List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
    int id;
    int userId;
    int ticketId;
    String comment;

    CommentModel({
        required this.id,
        required this.userId,
        required this.ticketId,
        required this.comment,
    });

    // factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    //     id: json["id"],
    //     userId: json["User_id"],
    //     ticketId: json["Ticket_id"],
    //     comment: json["Comment"],
    // );
      static List<CommentModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((item) => CommentModel(
              id: item['id'],
              userId: item['User_id'],
              ticketId: item['Ticket_id'],
              comment: item["Comment"],
            ))
        .toList();
  }

    Map<String, dynamic> toJson() => {
        "id": id,
        "User_id": userId,
        "Ticket_id": ticketId,
        "Comment": comment,
    };
}
