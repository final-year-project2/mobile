import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/controller/mega_product_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/progress_indicator.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  // const ProductDetail({super.key});
  final productDetailController = Get.find<MegaProductController>();
  TextEditingController numbereditingController = TextEditingController();
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
                isPassword: false,
                editingController: numbereditingController,
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
                  productDetailController.productDetail.value = numbereditingController.text;
                  print('number${ productDetailController.productDetail.value}');
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
