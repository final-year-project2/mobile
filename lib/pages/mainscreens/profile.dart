import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:chapa_unofficial/chapa_unofficial.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Balance'),
          Text('0'),
          VerticalSpace(10),
          Container(
              width: 150,
              height: 42,
              child: DefaultButton('add Money', false.obs))
        ],
      )),
    );
  }
}
