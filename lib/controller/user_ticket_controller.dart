import 'package:frontend/models/user_ticket_model.dart';
import 'package:get/state_manager.dart';
// import 'package:frontend/models/userTicketModel.dart';
import 'package:get/get.dart';
import 'package:frontend/services/http_services.dart';
import 'dart:convert';
import 'package:frontend/controller/UserController.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserTicketController extends GetxController {
  final BASE_URL = dotenv.env['BASE_URL'];
  HttpServices httpServices = HttpServices();
  UserTicketController() {
    httpServices.init();
  }
  List<UserTicket> tickets = [];
  Future<List<UserTicket>> getUserTickets(String user_id) async {
    try {
      final response = await httpServices
          .getRequest('http://10.0.2.2:8000/product/user/$user_id/tickets/');
      // await httpServices.getRequest('/product/live_ticket_list/1');
      print('user_ticket:${response}');

      List<dynamic> resultsList = response.data;
      print('RawLenght :${resultsList.length}');
      tickets = UserTicket.fromJsonList(resultsList);
      print('Lenght :${tickets.length}');
      //isLoading.value = false;

      print(
          '************************* ${UserTicket.fromJsonList(response.data)}');
      return tickets;
    } catch (e) {
      print('Error fetching tickets: $e');
      throw Exception(e);
    }
  }
}
