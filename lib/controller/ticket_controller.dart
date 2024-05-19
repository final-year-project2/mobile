import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/models/ticket_model.dart'; 
import 'package:get/get.dart';
import 'package:frontend/services/http_services.dart';
import 'package:get/get_rx/get_rx.dart';

class TicketController extends GetxController {
  final List<String> tabs = ['electronics', 'car', 'home']; 

  final Map<String, List<TicketModel>> tabData = {
    'all': [],
    'electronics': [], // Populate with data
    'car': [], // Populate with data
    'home': [],
    'other': [], // Populate with data
  };

  RxBool isTicketLoading = true.obs;
  HttpServices httpServices = HttpServices();

  TicketController() {
    httpServices.init();
  }

  @override
  void onInit() async {
    super.onInit();
    _preloadData();
  }

  // Future<List<TicketModel>> getTickets(String category) async {
  //   try {
  //     final response =
  //         await httpServices.getRequest('/product/ticket-list/$category');

  //     carCategory.value = await TicketModel.fromJsonList(response.data);
  //     electronicsCategory.value = await TicketModel.fromJsonList(response.data);
  //     homeCategory.value = await TicketModel.fromJsonList(response.data);
  //     isTicketLoading.value = false;

  //     print('Response:$response');

  //     return TicketModel.fromJsonList(response.data);
  //   } catch (e) {
  //     print('error transaction data $e');
  //     throw Exception(e);
  //   }
  // }

  Future<List<TicketModel>> getTickets(String category) async {
    try {
      final response =
          await httpServices.getRequest('/product/ticket-list/$category');
      // List jsonResponse = json.decode(response.data);
      return TicketModel.fromJsonList(response.data);
    } catch (e) {
      print('Error fetching tickets: $e');
      
      throw Exception(e);
    }
  }

  void _preloadData() async {
    for (var tab in tabs) {
      // Fetch data for the current tab
      List<TicketModel> data = await getTickets(tab);
      // Store the fetched data in tabData
    
      tabData[tab] = data;
      // print(tabData[tab]);
    }
  }
}
