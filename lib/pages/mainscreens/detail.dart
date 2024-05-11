import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:get/get.dart';
class DetailPage extends StatelessWidget {
DetailPage({super.key});
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            leading: GestureDetector(
              onTap: ()=>Get.back(),
              child: Icon(
                Icons.arrow_back,
                color: whiteColor,
                size: 30,
                ),
            ),
            backgroundColor: primaryColor,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background:PageView(
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                ],
              )
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
                children: [
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),

                ],
              ),
            )
        ],
      )
    );
  }
}