import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/product_image_controller.dart';
import 'package:frontend/pages/seller/product_description.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/progress_indicator.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProducImages extends StatelessWidget {
  final controller = Get.find<ProductImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBox(3),
              VerticalSpace(30),
              SizedBox(
                width: 310,
                child: Text(
                  'Nearly finished Add Images for your product',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              VerticalSpace(30),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  // textAlign: TextA
                  'Add cover image that will be displayed as Title photo',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              VerticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    // controller.pickImage();
                  },
                  child: Container(
                    width: 350,
                    height: 170,
                    decoration: BoxDecoration(
                      // image: controller.images.isNotEmpty
                      //     ? DecorationImage(
                      //         image: FileImage(File(xfile!.path)),
                      //         fit: BoxFit.cover,
                      //       )
                      //     : null,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: fotterTextColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add title photo',
                          style: TextStyle(),
                        ),
                        VerticalSpace(10),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            // size: 40,
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              VerticalSpace(40),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Add two iamge to describe the product more(Optional)',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              VerticalSpace(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 175,
                  child: GridView.builder(
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 175,
                          crossAxisSpacing: 35,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150,
                          // height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: fotterTextColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add title photo',
                                style: TextStyle(),
                              ),
                              VerticalSpace(10),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  // size: 40,
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              VerticalSpace(10),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Image size must not greater than 9mb ',
                  style: TextStyle(),
                ),
              ),
              VerticalSpace(10),
              Text(
                'Supported formats are .*jpg and .*png ',
                style: TextStyle(color: Color.fromARGB(255, 7, 165, 34)),
              ),
              VerticalSpace(20),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 0, 0),
                child: DefaultButton('Continue'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProducImaegController {}
