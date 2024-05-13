import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class page1 extends StatelessWidget {
  page1({super.key});
    final languacontroler = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height: 40,),  
          SizedBox(
            height: 420,
            child: Stack(
              children: [
              Lottie.asset('assets/page1.json',
              animate: true,
              backgroundLoading: true,
              
              ),
              Positioned(
                top: -10,
                right: 20,
                child: Obx(() => 
                DropdownButton(
                  value: languacontroler.dropdownValue.value,
                  style: TextStyle(color: thirdColor,fontSize: 18,fontWeight: FontWeight.bold),
                  icon: Icon(Icons.arrow_drop_down,color: thirdColor,), 
                  items: [
                    DropdownMenuItem<String>(
                      value: "language1".tr,
                      child: Text("language1".tr,
                      textAlign: TextAlign.center,)),
                    DropdownMenuItem<String>(
                      value: "language2".tr,
                      child: Text("አማረኛ",
                      textAlign: TextAlign.center,))
                  ], 
                  onChanged: (String? newValue){
                      languacontroler.dropdownValue.value = newValue!;
                      languacontroler.toggleLanguage(newValue);
                  }, 
                  ),
                )
              )
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Text('hello'.tr,style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold ,
                      fontSize: 30,
                      letterSpacing: 2
                    ),),
                    SizedBox(height: 6,),
                    Text('page1description'.tr,
                    style: TextStyle(
                      color: optionalgrayTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                    )
              ],
            ),
          ),
          GestureDetector(
            onTap: ()=>Get.toNamed('/landingpage'),
            child: Text('Skip'))
            // DefaultButton("skip".tr)
          ],
        ),
      ),
    );
  }
}
