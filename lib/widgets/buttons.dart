import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';

Widget DefaultButton(String text, RxBool isLoading) {
  
  return Container(
    height: 49,
    width: 342,
    decoration: BoxDecoration(
        color: primaryColor, borderRadius: BorderRadius.circular(5)),
    child: isLoading.value
        ? Center(
            child: SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Color.fromRGBO(92, 83, 54, 1),
                color: whiteColor),
          ))
        : Center(
            child: Text(
            text,
            style: TextStyle(
                color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          )),
  );
}
