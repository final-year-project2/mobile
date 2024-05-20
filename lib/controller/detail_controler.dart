import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend/models/purchasedTicketModel.dart';
import 'package:frontend/services/http_services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
class DetailControler extends GetxController{


  RxList ticketImage = ['assets/car2.jpg','assets/car2.jpg','assets/a.jpg'].obs;
  RxString PaymentTyle = "Wallet".obs;
  RxInt selectedTicketId = 0.obs;
  RxList SellectedTicketNo = [].obs;
  RxList purchasedTicketList = [].obs;
  RxList PurcasedTicketNoList = [].obs;
  RxBool isPending = false.obs;
  HttpServices httpServices = HttpServices();

DetailControler(){
  httpServices.init();
}


  
  void AddRemoveTicket(int number){
    if(SellectedTicketNo.contains(number)){
      SellectedTicketNo.remove(number);
    }else{
      SellectedTicketNo.add(number);
    }
    print(SellectedTicketNo);
  }

  void changePaymentType(){
    if(PaymentTyle.value == "Wallet" ){
      PaymentTyle.value = "Chapa" ;
    }else{
      PaymentTyle.value = "Wallet" ;
    }
  }

  
  Future<List<PurchasedTicketModel>> getTicketsInfo(String id) async {
    isPending.value = true;
    try {
      final response = await httpServices.getRequest('/ticket/purchased_ticket/${id}/');
      isPending.value = false;   
      return PurchasedTicketModel.fromJsonList(response.data);
    } catch (e) {
      print('Error fetching tickets djtail: ${e}');
      isPending.value = false;
      throw Exception(e);}
  }

  void GetPurchaseTicketNo(String id) async{
    PurcasedTicketNoList.value = await  getTicketsInfo(id);
    
    print('purchased ticket');
    print(PurcasedTicketNoList[1]);
    for (var name in PurcasedTicketNoList){
      purchasedTicketList.add(int.parse(name.Ticket_number));
    }
  }

}