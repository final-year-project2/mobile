import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

Widget PaymentPage(){
  
  return Container(
    padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: ()=>Get.back(),
                child: Icon(Icons.close,color: blackColor,size:25,weight: 30,)),
              SizedBox(width: 50,),
              Text('Make Payment',style: TextStyle(
                color: thirdColor,
                fontWeight: FontWeight.w600
              ),),
              Icon(Icons.wallet,color: thirdColor,size: 30,),

            ],
          ),
          SizedBox(
            height: 400,
            child: GridView.builder(
                        itemCount: 50,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColor
                              ),
                              width: 5,
                              height: 5,
                            ),
                          ); 
                      }),
          ),
        ],
      ),
    );
    }