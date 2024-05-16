import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/detail_controler.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/custom_form.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:frontend/widgets/carousel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controler = Get.find<DetailControler>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          backgroundColor: whiteColor,
          leading: GestureDetector(
            onTap: () => Get.offNamed('/homepage'),
            child: Icon(
              Icons.arrow_back,
              color: blackColor,
              size: 30,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondaryColor),
                ),
                onPressed: () {},
                child: Text(
                  'Buy ticket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.bookmark_add,
                size: 30,
                color: blackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.share,
                size: 30,
                color: blackColor,
              ),
            ),
          ],
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Container(

            decoration: BoxDecoration(
              color: whiteColor
            ),
            child: Stack(children: [
              CarouselWidjit(
                item: controler.ticketImage,
              ),
            ]),
          )),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                decoration: BoxDecoration(
                    color: homePageContainerBackground,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 20, 5),
                      child: Text(
                        'lorem ipsum transition ai ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: grayTextColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Price 10 Birr",style: TextStyle(
                                    color: grayTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),),
                                  Text("20 Tickets sold",style: TextStyle(
                                    color: thirdColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),),
                                  Text("10 Tickets remains",style: TextStyle(
                                    color: grayTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),),
                                ],
                              ),
                              CircularPercentIndicator(
                                radius: 50,
                                progressColor: thirdColor,
                                backgroundColor: blureGreen,
                                animation: true,
                                lineWidth: 15,
                                animationDuration: 2000,
                                percent: 0.7,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text('20'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DefaultButton("Buy Ticket", false.obs),
                          SizedBox(
                            height: 5,
                          ),
                          DefaultButton("Share Ticket", false.obs),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.person_4,
                    size: 40,
                    color: thirdColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Campiain creater',
                        style: TextStyle(
                            color: grayTextColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mandela .com',
                        style: TextStyle(color: grayTextColor),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 20,
                  color: grayTextColor,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: homePageContainerBackground,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas feugiat augue vel nisi ornare tincidunt. Ut nec erat enim. Proin rhoncus sodales arcu sit amet vulputate. Donec varius aliquam ex, at tincidunt ligula blandit nec. Fusce est tortor, molestie id neque ut, convallis rutrum sapien. Vestibulum posuere congue leo. Mauris vel augue odio. Integer vitae finibus massa. Fusce euismod eu metus nec lobortis. Integer imperdiet nibh eget pharetra tristique. Nunc sed pretium eros. Sed rutrum odio condimentum orci accumsan finibus. Nunc nisi augue, sagittis ut sodales molestie, suscipit vitae lorem. Sed luctus justo imperdiet dolor pellentesque, eu aliquet magna pharetra.pharetra pharetrapharetra pharetra .',
                  style: TextStyle(color: grayTextColor, fontSize: 13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  height: 10,
                  color: grayTextColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Comments ${controler.coments.length}',
                style: TextStyle(
                    color: grayTextColor, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 3, 5, 10),
                      decoration: BoxDecoration(
                          color: homePageContainerBackground,
                          borderRadius: BorderRadius.circular(5)),
                      child: CustomForm(hintText: 'Write comment')),
                  Icon(
                    Icons.send,
                    size: 40,
                    color: secondaryColor,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: controler.coments
                    .map((items) => Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              decoration: BoxDecoration(
                                  color: homePageContainerBackground),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person_2_outlined,
                                        color: secondaryColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Mandela .com'),
                                      Text(
                                        '  1hr ago',
                                        style: TextStyle(
                                            fontSize: 10, color: primaryColor),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "$items",
                                    style: TextStyle(
                                        fontSize: 13, color: grayTextColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              margin: EdgeInsets.only(left: 50, bottom: 15),
                              decoration: BoxDecoration(
                                  color: homePageContainerBackground),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Replay from ticket owner',
                                    style: TextStyle(color: secondaryColor),
                                  ),
                                  Text(
                                    '$items',
                                    style: TextStyle(
                                        fontSize: 13, color: grayTextColor),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
                              child: Divider(
                                height: 0,
                                color: grayTextColor,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
