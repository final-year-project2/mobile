import 'package:frontend/controller/sellerController.dart';
import 'package:frontend/models/ticket_model.dart';
import 'package:get/get.dart';
import 'package:frontend/services/http_services.dart';

class ActiveTicketController extends GetxController {
  final sellerController = Get.find<SellerController>();

  int? ticketId;

  List<TicketModel> tickets = [];

  void onInit() async {
    super.onInit();

    String sellerID = sellerController.sellerId.toString();

    print('from_active_idis :${sellerID}');
    getActiveTickets(sellerID);
  }

  RxBool isLoading = true.obs;
  HttpServices httpServices = HttpServices();
  ActiveTicketController() {
    httpServices.initAuthenticated();
  }
  int? index;

  // http://127.0.0.1:8000/product/live_ticket_list/2
  Future<List<TicketModel>> getActiveTickets(String seller_id) async {
    try {
      print('active ticket started');
      final response =
          await httpServices.getRequest('/product/live_ticket_list/$seller_id');
      isLoading.value = false;

      // await httpServices.getRequest('/product/live_ticket_list/1');
      print('list_live_ticket:${response}');

      List<dynamic> resultsList = response.data;
      print('RawLenght :${resultsList.length}');

      tickets = TicketModel.fromJsonList(resultsList);
      print('Lenght :${tickets.length}');

      print(
          '************************* ${TicketModel.fromJsonList(response.data)}');
      return tickets;
    } catch (e) {
      print('Error fetching tickets: $e');
      throw Exception(e);
    }
  }
}
