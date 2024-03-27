import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class page2 extends StatelessWidget {
  const page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [

        SizedBox(height: 15,),
        
        SizedBox(
          height: 420,
          child: Lottie.asset('assets/page2.json',
          animate: true,
          backgroundLoading: true
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text('Create Acount ',style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold ,
                    fontSize: 20,
                    letterSpacing: 2
                  ),),
                  SizedBox(height: 6,),
                  Text('To get started, create your personal account within the app. It is a quick and easy process that will enable you to access a wide variety of exciting lottery tikets, track your tickets, and manage your winnings all in one place. Your account information is securely protected, so you can play with confidence',
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