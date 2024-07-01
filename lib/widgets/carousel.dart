import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidjit extends StatelessWidget {
  final List? item;
  CarouselWidjit({this.item,super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
  options: CarouselOptions(
    height: double.infinity,
    viewportFraction: 1,
    initialPage: 0,
    autoPlay: false,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    autoPlayCurve: Curves.easeInOut,
    enlargeCenterPage: true,
    enlargeFactor: 0,
    scrollDirection: Axis.horizontal,
    ),
  items: [1,2,3].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          child:Container(
              margin: EdgeInsets.only(top:90),             
              child:Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                          item?[i-1] ?? 'assets/a.jpg',
                          width: MediaQuery.of(context).size.width-30,
                          height: 225,
                          fit: BoxFit.cover,
                      ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }).toList(),
);
}
}