import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:frontend/controller/Product_controller.dart';
import 'package:frontend/controller/categories_controller.dart';

import 'package:frontend/controller/Product_controller.dart';
import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/controller/Product_controller.dart';
import 'package:frontend/controller/categories_controller.dart';
import 'package:frontend/pages/seller/product_image.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/progress_indicator.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({super.key});
  final productDetailController = Get.find<ProductController>();
  final selectedvalue = Get.find<CategoryController>();
  TextEditingController numberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // const ProductDetail({super.key});
  // final productDetailController = Get.find<MegaProductController>();

  // TextEditingController numberController = TextEditingController();
  // final productDetailController = Get.find<MegaProductController>()
  final RxDouble sellerRevenue = 0.0.obs;

// Define commission tiers
  final List<Map<String, dynamic>> commissionTiers = [
    {'threshold': 1000.0, 'rate': 0.05}, // 5% for revenue up to 1000
    {'threshold': 5000.0, 'rate': 0.07}, // 7% for revenue between 1001 and 5000
    {'threshold': double.infinity, 'rate': 0.10}, // 10% for revenue above 5000
  ];

// Define delivery fee tiers
  final List<Map<String, dynamic>> deliveryFeeTiers = [
    {'threshold': 1000.0, 'rate': 0.01}, // 1% for revenue up to 1000
    {'threshold': 5000.0, 'rate': 0.02}, // 2% for revenue between 1001 and 5000
    {'threshold': double.infinity, 'rate': 0.03}, // 3% for revenue above 5000
  ];

  void _startDelayedCalculation(String value) {
    Future.delayed(Duration(seconds: 10), _calculateRevenue);
  }

  void _calculateRevenue() {
    int numberOfTickets = int.tryParse(numberController.text) ?? 0;
    double ticketPrice = double.tryParse(priceController.text) ?? 0.0;

    double totalRevenue = numberOfTickets * ticketPrice;
    double commission = _calculateCommission(totalRevenue);
    double deliveryFee = _calculateDeliveryFee(totalRevenue);

    sellerRevenue.value = totalRevenue - commission - deliveryFee;
  }

  double _calculateCommission(double totalRevenue) {
    for (var tier in commissionTiers) {
      if (totalRevenue <= tier['threshold']) {
        return totalRevenue * tier['rate'];
      }
    }
    // In case no tier matches, default to the highest rate (though logically unreachable)
    return totalRevenue * commissionTiers.last['rate'];
  }

  double _calculateDeliveryFee(double totalRevenue) {
    for (var tier in deliveryFeeTiers) {
      if (totalRevenue <= tier['threshold']) {
        return totalRevenue * tier['rate'];
      }
    }
    // In case no tier matches, default to the highest rate (though logically unreachable)
    return totalRevenue * deliveryFeeTiers.last['rate'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 50, 0, 0),
          child: ProgressBox(2),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ProgressBox(2),
              // VerticalSpace(30),
              Text(
                'DETAIL'.tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              VerticalSpace(10),
              Text(
                'NUBER_OF_TICKETS'.tr,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              CustomForm(
                editingController: numberController,
                isPassword: false,
                // editingController: numberController,
                hintText: 'e.g 100',
                onchanged: _startDelayedCalculation,
              ),
              VerticalSpace(30),
              Text(
                'CATEGORY'.tr,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Obx(() => CustomForm(
                    ontap: () {
                      Get.toNamed('/category');
                    },
                    isPassword: false,
                    readonly: true,
                    hintText: selectedvalue.selectedCategory.value.isEmpty
                        ? 'CLICK_HERE'.tr
                        : selectedvalue.selectedCategory.value,
                  )),
              VerticalSpace(30),
              Text(
                'PRICE_OF_TICKET'.tr,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              CustomForm(
                editingController: priceController,
                isPassword: false,
                // editingController: numberController,
                hintText: 'e.g 100',
                onchanged: _startDelayedCalculation,
              ),
              VerticalSpace(100),
              Obx(() => Text(
                    'Your Total revenue after Deduction: \$${sellerRevenue.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              // CustomForm(

              //   readonly: true,
              //   isPassword: false,
              //   hintText: 'Click here',
              // ),
              VerticalSpace(260),
              GestureDetector(
                onTap: () {
                  if (numberController.text.isEmpty) {
                    // Show an error message using a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter the number of tickets.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return; // Prevent navigation
                  }
                  // Validate that the input is a number
                  final numberPattern = RegExp(r'^\d+$');
                  if (!numberPattern.hasMatch(numberController.text)) {
                    // Show an error message using a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a valid number.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return; // Prevent navigation
                  }
                  // Parse the number and check if it's greater than zero
                  int ticketNumber = int.parse(numberController.text);
                  if (ticketNumber <= 0) {
                    // Show an error message using a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'The number of tickets must be greater than zero.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return; // Prevent navigation
                  }
                  //
                  if (numberController.text.isEmpty) {
                    // Show an error message using a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter the price of ticket.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return; // Prevent navigation
                  }
                  // Validate that the input is a number
                  final pricePattern = RegExp(r'^\d+$');
                  if (!pricePattern.hasMatch(numberController.text)) {
                    // Show an error message using a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a valid number.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return; // Prevent navigation
                  }
                  // Parse the number and check if it's greater than zero
                  int priceNumber = int.parse(priceController.text);
                  if (priceNumber <= 0) {
                    // Show an error message using a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'The price of tickets must be greater than zero.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return; // Prevent navigation
                  }
                  //
                  if (selectedvalue.selectedCategory.isEmpty) {
                    // Show an error message using a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select a category.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return; // Prevent navigation
                  }
                  productDetailController.number_of_tickets.value =
                      int.parse(numberController.text);
                  productDetailController.price_of_ticket.value =
                      int.parse(priceController.text);
                  Get.toNamed('/producimages');
                  //Get.to(ProducImages());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: DefaultButton('CONTINUE'.tr, false.obs),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
