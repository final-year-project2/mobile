import 'dart:convert';

import 'package:frontend/models/dashboard_model.dart';
import 'package:get/get.dart';
import 'package:frontend/services/http_services.dart';

class DashboardController extends GetxController {
  HttpServices httpServices = HttpServices();
  var categoryPercentages = <CategoryPercentage>[].obs;
  var frequentBuyerList = <FrequentBuyer>[].obs;

  DashboardController() {
    httpServices.initAuthenticated();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getPiChart('1');
    getFreqeuntBuyer('1');
    super.onInit();
  }

  Future<List<CategoryPercentage>> getPiChart(String id) async {
    try {
      final response = await httpServices
          .getRequest('/seller_admin/1/category-percentages/');
      print({response.data});
      categoryPercentages.value = CategoryPercentage.fromJsonList(
          response.data['category_percentages']);
      return CategoryPercentage.fromJsonList(
          response.data['category_percentages']);
    } catch (e) {
      print('Error on fetching on categroypercetage : ${e}');

      throw Exception(e);
    }
  }

  Future<List<FrequentBuyer>> getFreqeuntBuyer(String sellerId) async {
    print('frequent buyer start ');
    try {
      final response =
          await httpServices.getRequest('/seller_admin/frequent_buyer/1');
      print("frequent buyer ${response}");
      frequentBuyerList.value = FrequentBuyer.fromJsonList(response.data);
      return frequentBuyerList;
    } catch (e) {
      throw Exception('Exception @ getFrequentBuyer():${e}');
    }
  }
}
