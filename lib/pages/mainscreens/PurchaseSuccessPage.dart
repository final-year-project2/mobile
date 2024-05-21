import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseSuccess extends StatelessWidget {
  const PurchaseSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: ()=>Get.back(),
          child: Text('payment sucessfull')),
      ),
    );
  }
}