import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class DetailPage extends StatefulWidget {
DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {
List item = ['item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1','item1',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            leading: GestureDetector(
              onTap: ()=>Get.offNamed('/homepage'),
              child: Icon(
                Icons.arrow_back,
                color: whiteColor,
                size: 30,
                ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.bookmark,size: 40,color: primaryColor,),
              )
            ],
            backgroundColor: primaryColor,
            expandedHeight:250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                child: Text('this is yihenew'),
              ),
              background:Container(
                decoration: BoxDecoration(
                  color: Colors.yellow
                ),
                child: Stack(
                  children:[ 
                  CarouselSlider(
                    items:[
                      Container(
                        margin: EdgeInsets.only(bottom: 60),
                        child:Image.asset(
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              'assets/car1.jpg'),  
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 60),
                        child:Image.asset(
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              'assets/car2.jpg'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 60),
                        child:Image.asset(
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              'assets/a.jpg'),
                      )
                    ],
                    options:  CarouselOptions(
                            height: double.infinity,
                            viewportFraction: 1,
                            initialPage: 0,
                            autoPlay: false,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.easeInOut,
                            enlargeCenterPage: true,
                            enlargeFactor: 0,
                            scrollDirection: Axis.horizontal,
                          )),
                  ]
                ),
              )
            ),
          ),





          SliverToBoxAdapter(
              child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          decoration: BoxDecoration(
                            color: blureGreen,                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            children: [
                          Padding(
                          padding: const EdgeInsets.fromLTRB(15,10,20,5),
                          child: Text('lorem ipsum transition ai transition safe fse t',style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        LinearPercentIndicator(
                              width:MediaQuery.of(context).size.width-20,
                              lineHeight: 10,
                              animation: true,
                              animationDuration: 2000,
                              percent: 0.7,
                              barRadius:Radius.circular(10),
                              progressColor: primaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0 Birr'),
                              Text('100 Birr')
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            SizedBox(width: 15,),
                            Text("200" ,style: TextStyle(
                              color: thirdColor
                            ),),
                            SizedBox(width: 3,),
                            Text('People bought this ticket ')
                          ],
                        ),
                            ],
                          ),
                         ),
                        SizedBox(height: 20,),
                        DefaultButton("But Ticket",false.obs),
                        SizedBox(height: 20,),
                        DefaultButton("Share Ticket",false.obs),
                        Column(
                          children: item.map((items) => Padding(
                            padding: EdgeInsets.all(2),
                            child: Text("$items"),
                            )).toList(),
                        )
                          ],
                        ), 
                        
                ),
        ],
      )
    );
  }
}