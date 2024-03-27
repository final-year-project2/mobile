import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [

        SizedBox(height: 15,),
        
        SizedBox(
          height: 420,
          child: Lottie.asset('assets/page1.json',
          animate: true,
          backgroundLoading: true,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text('HELLO',style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold ,
                    fontSize: 30,
                    letterSpacing: 2
                  ),),
                  SizedBox(height: 6,),
                  Text('Welcome to our app designed to bring the joy of selling and buying the lottery tiket directly to your mobile device,We are committed to providing you with a seamless and user friendly experience that makes buying and selling the lottery convenient and easy',
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
          child: DefaultButton("Skip"))
        ],
      ),
    );
  }
}

  // Get.changeTheme(
  //         Get.isDarkMode?ThemeData.light():ThemeData.dark()
  //   );,