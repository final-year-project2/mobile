import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/progress_indicator.dart';
import 'package:get/get.dart';

class MerchantLegalInfo extends StatelessWidget {
  // const MerchantLegalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 50, 0, 0),
          child: ProgressBox(1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ProgressBox(1),
              // VerticalSpace(30),
              Text(
                'LegalInfo'.tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              VerticalSpace(10),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TIN Number"),
                    CustomForm(
                      isPassword: false,

                      // editingController: numberController,
                      hintText: 'e.g 1022112233',
                    ),
                    VerticalSpace(35),
                    Text("House  Number"),
                    CustomForm(
                      isPassword: false,

                      // editingController: numberController,
                      hintText: 'e.g 211',
                    ),
                    VerticalSpace(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("KEBELE".tr),
                              Padding(
                                padding: const EdgeInsets.only(right: 33.0),
                                child: CustomForm(
                                  isPassword: false,

                                  // editingController: numberController,
                                  hintText: 'e.g 211',
                                ),
                              ),
                            ],
                          ),
                        ),
                        HorizontalSpace(0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("SUBCITY"),
                              Padding(
                                padding: const EdgeInsets.only(right: 100),
                                child: SizedBox(
                                  width: 20,
                                  height: 2,
                                  child: DropdownMenu(
                                      // width: ,
                                      width: 159,
                                      menuHeight: 200,
                                      onSelected: (color) {
                                        if (color != null) {
                                          // setState(() {});
                                        }
                                      },
                                      dropdownMenuEntries: <DropdownMenuEntry<
                                          Color>>[
                                        DropdownMenuEntry(
                                            value: Colors.red,
                                            label: 'Addis Ababa'),
                                        DropdownMenuEntry(
                                            value: Colors.red,
                                            label: 'Akaki Kality'),
                                        DropdownMenuEntry(
                                            value: Colors.red, label: 'Arada'),
                                        DropdownMenuEntry(
                                            value: Colors.red, label: 'Bole'),
                                        DropdownMenuEntry(
                                            value: Colors.red, label: 'Gulele'),
                                        DropdownMenuEntry(
                                            value: Colors.red, label: 'Kirkos'),
                                        DropdownMenuEntry(
                                            value: Colors.red,
                                            label: 'Kolfe Keraniyo '),
                                        DropdownMenuEntry(
                                            value: Colors.red,
                                            label: 'Lideta '),
                                        DropdownMenuEntry(
                                            value: Colors.red,
                                            label: 'Nifas Silk... '),
                                        DropdownMenuEntry(
                                            value: Colors.red, label: 'Yeka'),
                                        DropdownMenuEntry(
                                            value: Colors.red,
                                            label: 'Lemi Kura'),
                                      ]),
                                ),
                                // child: CustomForm(
                                //   isPassword: false,

                                //   // editingController: numberController,
                                //   hintText: 'e.g 211',
                                // ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    VerticalSpace(40),
                    Text("Business Name"),
                    CustomForm(
                      isPassword: false,

                      // editingController: numberController,
                      hintText: 'e.g abc plc',
                    ),
                    VerticalSpace(40),
                    Text("Business Logo "),
                    CustomForm(
                      isPassword: false,
                      readonly: true,
                      // editingController: numberController,
                      hintText: 'click here',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
