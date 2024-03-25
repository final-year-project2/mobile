import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class page3 extends StatelessWidget {
  const page3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
    child:Column(
        children: [

        SizedBox(height: 15,),
        
        SizedBox(
          height: 420,
          child: Lottie.network('https://lottie.host/fa1f887d-e23b-4d2f-8795-13c4cc583252/3vQIEduzEp.json',
          animate: true,
          backgroundLoading: true
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text('FINALY ',style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold ,
                    fontSize: 20,
                    letterSpacing: 2
                  ),),
                  SizedBox(height: 6,),
                  Text('Get ready to immerse yourself in the world of lotteries with our App. Enjoy the convenience, excitement, and potential life-changing wins that await you. Our dedicated support team is available to assist you with any questions or concerns you may have',
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
      ));
  }
}