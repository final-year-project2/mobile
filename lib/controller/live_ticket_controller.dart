import 'dart:convert';

import 'package:frontend/controller/UserController.dart';
import 'package:frontend/controller/sellerController.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class LiveTicketController extends GetxController {
  late WebSocketChannel channel;
  final sellerController = Get.find<SellerController>();
  var ticketLeft = 000.obs;
  var numberOfBuyer = 0.obs;

  var total_ticket = 0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    int sellerid = sellerController.sellerId ?? 2;
    print('seller_id_live $sellerid');
    channel = WebSocketChannel.connect(
        Uri.parse('ws://10.0.2.2:8000/live_tickets/$sellerid'));
    channel.stream.listen((message) {
      // Handle the received message
      var response = parseResponse(message);
      print('socket_response $response');
      if (response != null) {
        ticketLeft.value = response['ticket_left'];
        isLoading.value = false;
        print('socket_data ${ticketLeft.value}');
        numberOfBuyer.value = response['number_of_buyer'];
        total_ticket.value = response['total_ticket'];
        print('total_ticketss ${total_ticket}');

        print('numberOfBuyer ${numberOfBuyer.value}');
      } else {
        print('response is null');
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
