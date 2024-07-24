import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  // const Setting({super.key});

  List<String> settignList = [
    'Langauge',
    'Dark mode',
    'Privacy Policy',
    'About us',
    'Log out'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ListView.builder(itemBuilder: (BuildContext context, int index))
          ],
        ),
      ),
    );
  }
}
