import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
<<<<<<< HEAD

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 420,
            child: Lottie.network(
              backgroundLoading: true,
              'https://lottie.host/4b4cb390-9684-4155-bdd6-a036d2b334c2/mDRHB6VmBq.json',
              animate: true,
              onLoaded: (composition) {
                setState(() {
                  isLoading =
                      false; // Set loading to false when the animation is loaded
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HELLO',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Welcome to our app designed to bring the joy of selling and buying the lottery tiket directly to your mobile device,We are committed to providing you with a seamless and user friendly experience that makes buying and selling the lottery convenient and easy',
                  style: TextStyle(
                      color: optionalgrayTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: () => Get.toNamed('/landingpage'),
              child: DefaultButton("Skip"))
        ],
=======
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
            child: DefaultButton("skip".tr))
          ],
        ),
>>>>>>> 95562b665f17fae4a2ee44d75b04fdba13b7e161
      ),
    );
  }
}
