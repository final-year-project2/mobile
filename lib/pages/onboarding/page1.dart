import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/language_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
    final languacontroler = Get.find<LanguageController>();
    String? dropdownValue ;

  @override
  void initState() {
    super.initState();
    dropdownValue = languacontroler.isEnglish.value ? "English" : 'አማረኛ';
  }
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
                child: DropdownButton(
                  value: dropdownValue,
                  style: TextStyle(color: primaryColor,fontSize: 18,fontWeight: FontWeight.bold),
                  icon: Icon(Icons.arrow_drop_down,color: primaryColor,), 
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
                    setState(() {
                      print('seted');
                      dropdownValue = newValue;
                      languacontroler.toggleLanguage(newValue!);
                    });
                  }, 
                  ),
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
      ),
    );
  }
}

  // Get.changeTheme(
  //         Get.isDarkMode?ThemeData.light():ThemeData.dark()
  //   );,