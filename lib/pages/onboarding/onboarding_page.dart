
import 'package:flutter/material.dart';
import 'package:frontend/pages/onboarding/page1.dart';
import 'package:frontend/pages/onboarding/page2.dart';
import 'package:frontend/pages/onboarding/page3.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:frontend/constants.dart';
class onboarding_page extends StatefulWidget {
  const onboarding_page({super.key});

  @override
  State<onboarding_page> createState() => _onboarding_pageState();
}

class _onboarding_pageState extends State<onboarding_page> {
  PageController controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index){
              setState(() {
                if(index==2){
                  isLastPage = true;
                }else{
                  isLastPage = false; 
                }
              });
            },
            children: [
              page1(),
              page2(),
              page3()
            ],
          ),
          Container(
            alignment: Alignment(0,0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    controller.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.linear);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: primaryColor,
                    ),
                ),
                SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: const WormEffect(
                          dotColor: fotterTextColor,
                          activeDotColor: primaryColor
                          ),
                        ),
                if(!isLastPage)
                GestureDetector(
                  onTap: (){
                    controller.nextPage(duration: const Duration(milliseconds: 400),curve: Curves.linear);
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: primaryColor,
                    ),
                ),

                if(isLastPage)
                GestureDetector(
                  onTap:  () => Get.toNamed('/landingpage'),
                  child: Text('GO',style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold
                      )),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}