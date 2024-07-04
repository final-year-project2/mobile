import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class LiveTicketController extends GetxController {
  late WebSocketChannel channel;
  var ticketLeft = 0.obs;
  var numberOfBuyer = 0.obs;
  @override
  void onInit() {
    channel = WebSocketChannel.connect(
        Uri.parse('ws://10.0.2.2:8000/live_tickets/1'));
    channel.stream.listen((message) {
      // Handle the received message
      var response = parseResponse(message);
      if (response != null) {
        ticketLeft.value = response['ticket_left'];
        print('left ticket ${ticketLeft.value}');
        numberOfBuyer.value = response['number_of_buyer'];
        print('numberOfBuyer ${numberOfBuyer.value}');
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    channel.sink.close(status.goingAway);
    super.onClose();
  }

  Map<String, dynamic>? parseResponse(String message) {
    try {
      return jsonDecode(message);
    } catch (e) {
      print('Error parsing response: $e');
      return null;
    }
  }
}
