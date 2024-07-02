import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/models/ticket_model.dart';
import 'package:get/get.dart';
import 'package:frontend/services/http_services.dart';
// import 'package:get/get_rx/get_rx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TicketController<T> extends GetxController {
  final List<String> tabs = ['all', 'electronics', 'car', 'home', 'other'];

  final Map<String, PagingController<int, TicketModel>> pagingControllers = {
    'all': PagingController(firstPageKey: 1),
    'electronics': PagingController(firstPageKey: 1),
    'car': PagingController(firstPageKey: 1),
    'home': PagingController(firstPageKey: 1),
    'other': PagingController(firstPageKey: 1),
  };

  Future<List<TicketModel>> _fetchTickets(String category, int pageKey) async {
    try {
      final response = await httpServices
          .getRequest('/product/ticket-list/$category?page=$pageKey');

      List<dynamic> resultsList = response.data['results'];
      List<TicketModel> tickets = TicketModel.fromJsonList(resultsList);
      // final response =
      //     await httpServices.getRequest('/product/ticket-list/$category/?page=$pageKey');
      print(
          '=================================== ${TicketModel.fromJsonList(response.data['results'])}');
      return tickets;
    } catch (e) {
      print('Error fetching tickets: $e');
      throw Exception(e);
    }
  }

  void _preloadData() {
    for (var tab in tabs) {
      // Initialize each PagingController
      pagingControllers[tab]?.addPageRequestListener((pageKey) {
        _fetchPage(tab, pageKey);
      });

      // Trigger initial data load
      _fetchPage(tab, pagingControllers[tab]?.firstPageKey ?? 0);
    }
  }

  void _fetchPage(String tab, int pageKey) async {
    try {
      final items = await _fetchTickets(tab, pageKey);
      final isLastPage =
          items.length < 1; // Adjust this based on your API response
      if (isLastPage) {
        pagingControllers[tab]?.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        pagingControllers[tab]?.appendPage(items, nextPageKey);
      }
    } catch (error) {
      pagingControllers[tab]?.error = error;
    }
  }

  @override
  void dispose() {
    for (var controller in pagingControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  // final Map<String, List<TicketModel>> tabData = {
  //   'all': [],
  //   'electronics': [], // Populate with data
  //   'car': [], // Populate with data
  //   'home': [],
  //   'other': [], // Populate with data
  // };

  RxBool isTicketLoading = true.obs;
  HttpServices httpServices = HttpServices();

  TicketController() {
    httpServices.init();
  }
  final RxBool isLoading = false.obs;

  @override
  void onInit() async {
    _preloadData();
    super.onInit();
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

  // Future<List<TicketModel>> getTickets(String category) async {
  //   try {
  //     final response =
  //         await httpServices.getRequest('/product/ticket-list/$category');
  //     // List jsonResponse = json.decode(response.data);
  //     return TicketModel.fromJsonList(response.data);
  //   } catch (e) {
  //     print('Error fetching tickets: $e');

  //     throw Exception(e);
  //   }
  // }

  refreshTickets(String category) {
    final pagingController = pagingControllers[category];
    if (pagingController != null) {
      pagingController.refresh();
    }
  }

  double normalizeNumberOfUser(String numberOfBuyer, String totalTicket) {
    double localNumberOfBuyer = double.tryParse(numberOfBuyer) ?? 0;
    double localTotalTicket = double.tryParse(totalTicket) ?? 1;
    double normalizedData = (localNumberOfBuyer) / (localTotalTicket);
    return normalizedData;
  }

  // void _preloadData() async {
  //   for (var tab in tabs) {
  //     // Fetch data for the current tab
  //     List<TicketModel> data = await getTickets(tab);
  //     // Store the fetched data in tabData
  //     tabData[tab] = data;

  //     print('${tabData[tab]}');
  //   }
  // }
}
