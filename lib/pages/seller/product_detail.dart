import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/controller/Product_controller.dart';
import 'package:frontend/controller/categories_controller.dart';
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
                hintText: 'e.g 100',
              ),
              VerticalSpace(30),
              Text(
                'CATEGORY'.tr,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              CustomForm(
                ontap: () {
                  Get.toNamed('/category');
                },
                isPassword: false,
                readonly: true,
                hintText: 'CLICK_HERE'.tr,
              ),
              // CustomForm(

              //   readonly: true,
              //   isPassword: false,
              //   hintText: 'Click here',
              // ),
              VerticalSpace(450),
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
                  if (selectedvalue.selectedCategories.isEmpty) {
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
                  Get.toNamed('/producimages');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
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
