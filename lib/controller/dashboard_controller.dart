import 'dart:convert';

import 'package:frontend/controller/sellerController.dart';
import 'package:frontend/models/dashboard_model.dart';
import 'package:get/get.dart';
import 'package:frontend/services/http_services.dart';

class DashboardController extends GetxController {
  HttpServices httpServices = HttpServices();
  var categoryPercentages = <CategoryPercentage>[].obs;
  RxBool isLoading = true.obs;
  var frequentBuyerList = <FrequentBuyer>[].obs;
  final sellerController = Get.find<SellerController>();

  DashboardController() {
    httpServices.initAuthenticated();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getPiChart('1');
    getFreqeuntBuyer('1');
    // getPiChart(sellerController.sellerId?.toString() ?? '');
    // print('dashboardSELLER${sellerController.sellerId}');
    // getFreqeuntBuyer(sellerController.sellerId?.toString() ?? '');
    super.onInit();
  }

  Future<List<CategoryPercentage>> getPiChart(String id) async {
    try {
      final response = await httpServices
          .getRequest('/seller_admin/$id/category-percentages/');
      print({response.data});
      categoryPercentages.value = CategoryPercentage.fromJsonList(
          response.data['category_percentages']);
      isLoading.value = false;

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
      final response = await httpServices
          .getRequest('/seller_admin/frequent_buyer/$sellerId');
      print("frequent buyer ${response}");
      frequentBuyerList.value = FrequentBuyer.fromJsonList(response.data);
      isLoading.value = false;

      return frequentBuyerList;
    } catch (e) {
      throw Exception('Exception @ getFrequentBuyer():${e}');
    }
  }
}
