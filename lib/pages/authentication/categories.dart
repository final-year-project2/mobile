import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/layout.dart';

class Category extends StatelessWidget {
  Category({super.key});

  var categories = [
    'Electronics',
    'House',
    'Holiday',
    'Holiday',
    'Electronics',
    'House',
    'Holiday',
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
              Wrap(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: primaryColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text('s'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
