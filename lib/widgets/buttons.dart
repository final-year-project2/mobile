import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

Widget DefaultButton(String text) {
  return Container(
    height: 49,
    width: 342,
    decoration: BoxDecoration(
        color: primaryColor, borderRadius: BorderRadius.circular(5)),
    child: Center(
        child: Text(
      text,
      style: TextStyle(
          color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
    )),
  );
}
