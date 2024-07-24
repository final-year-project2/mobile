import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:frontend/models/TicketCommentModel.dart';
import 'package:get/get.dart';
import 'package:frontend/models/purchasedTicketModel.dart';
import 'package:frontend/services/http_services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DetailControler extends GetxController {
  RxList ticketImage =
      ['assets/car2.jpg', 'assets/car2.jpg', 'assets/a.jpg'].obs;
  RxString PaymentType = "from_wallet".obs;
  RxInt selectedTicketId = 0.obs;
  RxList SellectedTicketNo = [].obs;
  RxList<dynamic> SelectedTicketObject = [].obs;
  RxList purchasedTicketList = [].obs;
  RxList PurcasedTicketNoList = [].obs;
  RxList TicketCommentList = [].obs;
  RxBool isPending = false.obs;
  RxBool isSeccess = false.obs;
  RxMap Ticket = {}.obs;
  HttpServices httpServices = HttpServices();

  DetailControler() {
    httpServices.initAuthenticated();
  }
  void SetComment(String comment) async {
    Comment(comment);
  }

  Future Comment(String comment) async {
    try {
      final response = await httpServices.postRequest(
          'comment/', {"Ticket_id": Ticket['id'], "Comment": comment});
      print(response);
    } on dio.DioException catch (e) {
      print('Purchasing error:$e');
      throw Exception(e);
    }
  }

  Future<List<CommentModel>> getTicketsComment() async {
    try {
      final response = await httpServices.getRequest('comment/${Ticket['id']}');
      isPending.value = false;
      return CommentModel.fromJsonList(response.data);
    } catch (e) {
      print('Error fetching tickets djtail: ${e}');
      isPending.value = false;
      throw Exception(e);
    }
  }

  void getComment() async {
    TicketCommentList.value = await getTicketsComment();
  }

  void AddRemoveTicket(int number) {
    if (SellectedTicketNo.contains(number)) {
      SellectedTicketNo.remove(number);
      SelectedTicketObject.value = SelectedTicketObject.where(
          (ticket) => ticket['Ticket_number'] != number.toString()).toList();
      // SelectedTicketObject.remove({"Ticket_id":Ticket['id'],"Ticket_number":number.toString()});
    } else {
      SellectedTicketNo.add(number);
      SelectedTicketObject.add({
        "Ticket_id": Ticket['id'],
        "Ticket_number": "$number",
        "Transaction_from": PaymentType.toString()
      });
    }
    print(SelectedTicketObject);
  }

  void changePaymentType() {
    print(SelectedTicketObject[0]['Transaction_from']);
    if (SelectedTicketObject.isEmpty) {
      print('selectedlength ${SelectedTicketObject.length}');
    } else if (PaymentType.value == "from_wallet") {
      PaymentType.value = "from_chapa";
      if (!SelectedTicketObject.isEmpty && SelectedTicketObject.length > 0) {
        for (int index = 0; index < SelectedTicketObject.length; index++) {
          SelectedTicketObject[index]['Transaction_from'] = "from_chapa";
        }
      }
    } else {
      PaymentType.value = "from_wallet";
      if (SelectedTicketObject.length > 0) {
        for (int index = 0; index < SelectedTicketObject.length; index++) {
          SelectedTicketObject[index]['Transaction_from'] = "from_wallet";
        }
      }
    }
  }

  Future<List<PurchasedTicketModel>> getTicketsInfo(String id) async {
    isPending.value = true;
    PurcasedTicketNoList.value = [];
    SellectedTicketNo.value = [];
    SelectedTicketObject.value = [];
    // Detailcontroler.purchasedTicketList.value = [];
    try {
      final response =
          await httpServices.getRequest('/ticket/purchased_ticket/${id}/');
      print('Ticket_idi ${id}');
      isPending.value = false;
      return PurchasedTicketModel.fromJsonList(response.data);
    } catch (e) {
      print('Error fetching tickets djtail: ${e}');
      isPending.value = false;
      throw Exception(e);
    }
  }

  void GetPurchaseTicketNo() async {
    PurcasedTicketNoList.value = await getTicketsInfo(Ticket['id'].toString());
    for (var name in PurcasedTicketNoList) {
      purchasedTicketList.add(int.parse(name.Ticket_number));
    }
    print('object');
    print(purchasedTicketList.length);
  }

  Future<dio.Response> PurchaseTicket() async {
    try {
      final response = await httpServices.postRequest(
          '/ticket/purchase/', SelectedTicketObject);
      SellectedTicketNo.value = [];
      return response;
    } on dio.DioException catch (e) {
      print('Purchasing error:$e');
      throw Exception(e);
    }
  }

  void callPurchaseTicket() async {
    var response = await PurchaseTicket();
    Get.toNamed('PurchaseSuccess');
  }

  Future<void> pay(final context) async {
    String txRef = TxRefRandomGenerator.generate(prefix: 'Pharmabet');
    String storedTxRef = TxRefRandomGenerator.gettxRef;

    print('Generated TxRef: $txRef');
    print('Stored TxRef: $storedTxRef');
    try {
      await Chapa.getInstance.startPayment(
        context: context,
        enableInAppPayment: true,
        onInAppPaymentSuccess: (successMsg) {
          callPurchaseTicket();
          Get.toNamed('PurchaseSuccess');
        },
        onInAppPaymentError: (errorMsg) {
          print('errorMsg $errorMsg');
        },
        amount:
            (SellectedTicketNo.length * int.parse(Ticket['price_of_ticket']))
                .toString(),
        currency: 'ETB',
        txRef: storedTxRef,
      );
    } on ChapaException catch (e) {
      if (e is AuthException) {
        print('In app $e ');
      } else if (e is InitializationException) {
        print('In app $e ');
      } else if (e is NetworkException) {
        print('In app $e ');
      } else if (e is ServerException) {
        print('In app $e ');
      } else {
        print('Unknown error please try again');
      }
    }
  }
}
