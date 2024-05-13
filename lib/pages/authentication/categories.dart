import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/Product_controller.dart';
import 'package:frontend/controller/categories_controller.dart';

import 'package:frontend/pages/seller/product_image.dart';

import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  Category({super.key});

  final productSelector = Get.find<ProductController>();

  final List<String> categories = [
    'Electronics',
    'House',
    'Holiday',
    'Holiday',
    'Electronics',
    'House',
    'Holiday',
    'Additional',
    'Random',
    'Creative',
    'car',
    'home gadgets',
    'Creative',
  ];
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 35),
                child: Logo(),
              ),
              Text(
                maxLines: 2,
                'Let us begin your prize Journey',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              VerticalSpace(50),
              SizedBox(
                width: 330,
                child: Text(
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  'What kind of prize are you interseted in the most?',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              VerticalSpace(40),
              Wrap(
                spacing: 15,
                runSpacing: 20,
                children: categories
                    .map((
                      category,
                    ) =>
                        Obx(() => GestureDetector(
                              onTap: () {
                                controller.toggleCategories(category);
                                productSelector.addToList(category);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    //If the name is found in the list of selctedcategroy change the color else not
                                    color: controller.selectedCategories
                                            .contains(category)
                                        ? colorForContrast
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: primaryColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(category),
                                ),
                              ),
                            )))
                    .toList(),
              ),
              VerticalSpace(50),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10, 0, 100),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: DefaultButton('Continue', false.obs)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
