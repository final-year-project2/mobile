import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/Product_controller.dart';
import 'package:frontend/controller/product_image_controller.dart';
import 'package:frontend/pages/seller/product_description.dart';
import 'package:frontend/pages/seller/save_product.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/progress_indicator.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProducImages extends StatelessWidget {
  final controller = Get.find<ProductImageController>();
  final productController = Get.find<ProductController>();
  final productService = Get.find<ProductService>();
  // Corrected method name: getImage
  Future<void> _showImageSourceActionSheet(
      BuildContext context, int index) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  controller.pickImage(index, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  controller.pickImage(index, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 50, 0, 0),
              child: ProgressBox(3),
            )),
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ProgressBox(3),
                    // VerticalSpace(30),
                    SizedBox(
                      width: 350,
                      child: Text(
                        'NEARLY_FINISHED'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                    VerticalSpace(15),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'COVER_IMAGE'.tr,
                        style: TextStyle(
                            letterSpacing: 1.5,
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
                          _showImageSourceActionSheet(context, 0);
                          // controller.images[1];
                        },
                        child: Center(
                          child: Container(
                            width: 300,
                            height: 250,
                            decoration: BoxDecoration(
                              image: controller.images.length > 0
                                  ? DecorationImage(
                                      image: FileImage(
                                          File(controller.images[0].path)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: fotterTextColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.images.length > 0
                                      ? ''
                                      : 'TITLE_PHOTO'.tr,
                                  style: TextStyle(),
                                ),
                                VerticalSpace(10),
                                IconButton(
                                  onPressed: () {
                                    _showImageSourceActionSheet(context, 0);
                                  },
                                  icon: Icon(controller.images.length > 0
                                      ? null
                                      : Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalSpace(15),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'ADDITIONAL_PHOTO'.tr,
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    VerticalSpace(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        height: 175,
                        child: GridView.builder(
                            itemCount: 2,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 175,
                                    crossAxisSpacing: 35,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _showImageSourceActionSheet(
                                      context, index + 1);
                                },
                                child: Container(
                                  width: 150,
                                  // height: 180,
                                  decoration: BoxDecoration(
                                    image: controller.images.length > index + 1
                                        ? DecorationImage(
                                            image: FileImage(File(controller
                                                .images[index + 1].path)),
                                            fit: BoxFit.fill,
                                          )
                                        : null,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: fotterTextColor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.images.length > index + 1
                                              ? ''
                                              : '',
                                          style: TextStyle(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: IconButton(
                                            onPressed: () {
                                              _showImageSourceActionSheet(
                                                  context, index + 1);
                                            },
                                            icon: Icon(
                                                controller.images.length >
                                                        index + 1
                                                    ? null
                                                    : Icons.add),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    // VerticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'IMAGE_SIZE'.tr,
                        style: TextStyle(),
                      ),
                    ),
                    VerticalSpace(5),
                    Text(
                      'SUPPORTED_FORMATS'.tr,
                      style: TextStyle(color: Color.fromARGB(255, 7, 165, 34)),
                    ),
                    // VerticalSpace(20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 10, 0, 40),
                      child: GestureDetector(
                        onTap: () async {
                          if (productController.image_1.value == null) {
                            // Show an error message using a SnackBar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('First image field is required'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else {
                            // Call sendProductDataToDatabase() when the button is pressed
                            print('title: ${productController.title.value}');
                            print(
                                'description: ${productController.description.value}');
                            print(
                                'category: ${productController.prizeCategory.value}');
                            print(
                                'Image 1 path: ${productController.image_1.value?.path}');

                            // Print form data
                            final formData =
                                await productService.prepareFormData();
                            formData.fields.forEach((field) {
                              print('${field.key}: ${field.value}');
                            });
                            //Send product data to database
                            try {
                              await productService.sendProductDataToDatabase();
                              // Show success message using a SnackBar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Product Sent Successfully'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              Get.toNamed('/homepage');
                            } catch (e) {
                              // Handle DioException or any other error
                              print('Error sending product data: $e');
                            }
                          }
                        },
                        child: DefaultButton(
                          'CONTINUE'.tr,
                          false.obs,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

class ProducImaegController {}
