import 'dart:convert';

import 'package:frontend/models/dashboard_model.dart';
import 'package:get/get.dart';
import 'package:frontend/services/http_services.dart';

class DashboardController extends GetxController {
  HttpServices httpServices = HttpServices();
  var categoryPercentages =
      <CategoryPercentage>[].obs; // Make sure to import your model correctly

  DashboardController() {
    httpServices.initAuthenticated();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getPiChart('1');
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
}
