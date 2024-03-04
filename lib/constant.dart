import 'package:flutter/material.dart';

const goldenColor = Color.fromRGBO(253, 195, 2, 1);
const whiteColor = Color.fromRGBO(255, 255, 255, 1);
const grayTextColor = Color.fromRGBO(114, 112, 112, 1);
const fotterTextColor = Color.fromRGBO(173, 171, 171, 1);
Widget VerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget HorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget button({required height, required width}) {
  return Container();
}

Widget DefaultButton(String text) {
  return Container(
    height: 49,
    width: 342,
    decoration: BoxDecoration(
        color: goldenColor, borderRadius: BorderRadius.circular(5)),
    child: Center(
        child: Text(
      text,
      style: TextStyle(
          color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
    )),
  );
}

Widget HorizontalLine({required double height, required double width}) {
  return Container(
    height: height,
    width: width,
    color: Color.fromRGBO(184, 184, 184, 1),
  );
}
