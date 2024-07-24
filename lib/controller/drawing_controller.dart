import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:frontend/controller/active_ticket_controller.dart';
import 'package:frontend/models/winner.dart';
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Drawing extends GetxController {
  HttpServices? httpServices;
  WinnerModel? winner; // Declare a variable to hold the winner model

  final activeTicektController = Get.find<ActiveTicketController>();
  @override
  void onInit() async {
    super.onInit();
    // await getWinner();
  }

  Drawing() {
    httpServices = HttpServices();
    httpServices?.initAuthenticated();
    // await getWinner();
  }

  // Future<dio.Response> getWinner() async {
  //   print('get_winner_start');
  //   try {
  //     final response = await httpServices!.postRequest(
  //         "http://10.0.2.2:8000/product/select-winner/", {"Ticket_id": "105"});
  //     if (response.statusCode != 200) {
  //       // Assuming 200 OK is success
  //       print('Response status code: ${response.statusCode}');
  //       print('Response body: ${response.data}');
  //     }
  //     print("''''''''''''''''''''''''''*''''''''''''''''''''''''''");
  //     print(response.statusCode);
  //     // if (response == null) {
  //     //   print('null_winner');
  //     // }
  //     return response;
  //   } on dio.DioException catch (e) {
  //     print('exception at winner :${e} ');

  //     throw Exception(e);
  //   }
  // }

  Future<void> getWinner() async {
    int? id = activeTicektController.ticketId;
    print('Ticket_id_live ${id}');

    print('get_winner_started');
    try {
      final url = Uri.parse("http://10.0.2.2:8000/product/select-winner/");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"Ticket_id": "$id"}),
      );

      if (response.statusCode == 200) {
        // Assuming 200 OK is success
        print('Response status code: ${response.statusCode}');
        print('Response_body: ${response.body}');
        try {
          final s = jsonDecode(response.body);
          print('decoded ${s}');
          winner = WinnerModel.fromJson(jsonDecode(response.body));
          print('valuee:${winner?.message}');
        } catch (e) {
          print('Conversion error :$e');
        }
        print('Winner_Model: ${winner?.toJson()}');
      } else {
        print('Request successful');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
