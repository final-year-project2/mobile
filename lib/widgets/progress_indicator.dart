import 'package:flutter/material.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/constants.dart';

Widget ProgressBox(int page) {
  return Row(
    children: [
      Container(
        width: 120,
        height: 6,
        color: primaryColor,
      ),
      HorizontalSpace(10),
      Container(
        width: 120,
        height: 6,
        color: page >= 2 ? primaryColor : darklight,
      ),
      HorizontalSpace(10),
      Container(
        width: 120,
        height: 6,
        color: page >= 3 ? primaryColor : darklight,
      )
    ],
  );
}
