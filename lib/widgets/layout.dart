import 'package:flutter/material.dart';

Widget HorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget VerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget HorizontalLine({required double height, required double width}) {
  return Container(
    height: height,
    width: width,
    color: Color.fromRGBO(184, 184, 184, 1),
  );
}
