import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  Category({super.key});

  final List<String> categories = [
    'Electronics',
    'House',
    'Holiday',
    'Holiday',
    'Electronics',
    'House',
    'Holiday',
    'Additional',
    'Random',
    'Creative',
    'car',
    'home gadgets',
    'Creative',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 35),
                child: Logo(),
              ),
              Text(
                maxLines: 2,
                'Let us begin your prize Journey',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              VerticalSpace(50),
              SizedBox(
                width: 330,
                child: Text(
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  'What kind of prize are you interseted in the most?',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              VerticalSpace(40),
              GestureDetector(
                onTap: () {},
                child: Wrap(
                  spacing: 15,
                  runSpacing: 20,
                  children: categories
                      .map((category) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: primaryColor)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(category),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
