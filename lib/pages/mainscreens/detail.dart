import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/detail_controler.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class DetailPage extends StatefulWidget {
DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Controler = Get.find<DetailControler>();
  Timer? _timer;

  void startTimer(){
    _timer = Timer.periodic(Duration(seconds: 4), (timer) { 
      if (Controler.pageController.page == 2){
          Controler.pageController.animateToPage(0,duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
      }else{
        Controler.pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            leading: GestureDetector(
              onTap: ()=>Get.back(),
              child: Icon(
                Icons.arrow_back,
                color: whiteColor,
                size: 30,
                ),
            ),
            backgroundColor: primaryColor,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background:Stack(
                children:[ 
                  PageView(
                  controller:Controler.pageController,
                  children: [
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.yellow,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment(0, 0.9),
                  child: SmoothPageIndicator(
                        controller: Controler.pageController,
                        count: 3,
                        effect: const WormEffect(
                            dotWidth: 13,
                            dotHeight: 13,
                            dotColor: fotterTextColor,
                            activeDotColor: primaryColor),
                      ),
                  )
                ]
              )
            ),
          ),


          SliverToBoxAdapter(
              child: Column(
                children: [
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),

                ],
              ),
            )
        ],
      )
    );
  }
}