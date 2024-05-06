import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List tabBarList = ['All', 'Electronics', 'Car', 'Home', 'Others'];
  List campaign = [
    'First',
    'Second',
    'Third',
    'Third',
    'Third',
  ];

  void handelevent() {
    setState(() {
      currentIndex = tabController.index;
    });
  }

  late TabController tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    final TabController tabController =
        TabController(length: tabBarList.length, vsync: this);
    tabController.addListener(handelevent);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context);
    final TabController tabController =
        TabController(length: tabBarList.length, vsync: this);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Icon(Icons.menu),
            actions: [
              Container(
                width: 225,
                height: 33,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: whiteColor),
                  child: Row(
                    children: [
                      HorizontalSpace(7),
                      Icon(Icons.search),
                      HorizontalSpace(10),
                      Text('Search'),
                    ],
                  ),
                ),
              ),
              HorizontalSpace(15),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(size: 35, Icons.account_circle_sharp),
              ),
            ],
            expandedHeight: 180,
            flexibleSpace: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  width: screenSize.size.width,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35))),
                ),
                Positioned(
                  left: 39,
                  bottom: -60,
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: screenSize.size.width * 0.37,
                      width: screenSize.size.width * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: homePageBannerColor2),
                    ),
                    Positioned(
                        top: -90,
                        left: 15,
                        child: Container(
                          width: screenSize.size.width * 0.85,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Image.asset(
                                    width: 90, 'assets/winningCroped.png'),
                              ),
                              HorizontalSpace(25),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 90.0),
                                  child: Text(
                                      softWrap: true,
                                      maxLines: 7,
                                      "Don't just win, win exactly what you want .",
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          color: whiteColor,
                                          fontSize: 20)),
                                ),
                              )
                            ],
                          ),
                        ))
                  ]),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: VerticalSpace(80),
          ),
          SliverToBoxAdapter(
            child: DefaultTabController(
              length: tabBarList.length,
              child: TabBar(
                  padding: EdgeInsets.only(bottom: 10),
                  labelPadding: currentIndex == 0
                      ? EdgeInsets.fromLTRB(10, 0, 8, 0)
                      : EdgeInsets.fromLTRB(0, 10, 10, 20),
                  enableFeedback: false,
                  indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  // padding: EdgeInsets.all(23),
                  controller: tabController,
                  splashFactory: NoSplash.splashFactory,
                  tabs: List.generate(
                      tabController.length,
                      (index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: currentIndex == index
                                    ? primaryColor
                                    : Color.fromRGBO(224, 224, 224, 1)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Text(
                                tabBarList[index],
                                style: TextStyle(
                                    color: currentIndex == index
                                        ? Colors.white
                                        : Color.fromRGBO(130, 130, 130, 1)),
                              ),
                            )),
                          ))),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: double.infinity,
                height: 500,
                child: TabBarView(
                    controller: tabController,
                    children: tabBarList
                        .map((e) => ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8.0, 0, 8, 15),
                                  child: Container(
                                      width: 400,
                                      height: 175,
                                      decoration: BoxDecoration(
                                          color: homePageContainerBackground,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            width: 130,
                                            height: 180,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(0),
                                                bottomLeft: Radius.circular(10),
                                                topRight: Radius.circular(0),
                                                topLeft: Radius.circular(10),
                                              ),
                                              child: Image.asset(
                                                  fit: BoxFit.cover,
                                                  // scale: 0.9,
                                                  'assets/a.jpg'),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 180,
                                            width: 260,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10.0, 10, 10, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // mainAxisAlignment:
                                                // MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    maxLines: 3,
                                                    softWrap: true,
                                                    'Samsung pro max  12cc right bright ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "30",
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 11,
                                                            color:
                                                                primaryColor)),
                                                    TextSpan(
                                                        text: " Tickets Left",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 11,
                                                                color:
                                                                    subTextColor))
                                                  ])),
                                                  VerticalSpace(7),
                                                  LinearProgressIndicator(
                                                    value: 0.3,
                                                    minHeight: 7,
                                                    backgroundColor:
                                                        progressBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: progressColor,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('0',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color:
                                                                      subTextColor,
                                                                  fontSize: 9)),
                                                      Text(
                                                        '200 Ticket ',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    subTextColor,
                                                                fontSize: 9),
                                                      ),
                                                    ],
                                                  ),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "300",
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 11,
                                                            color:
                                                                progressColor)),
                                                    TextSpan(
                                                        text:
                                                            " People bought this  ticket",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 11,
                                                                color:
                                                                    blackColor))
                                                  ])),
                                                  VerticalSpace(10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: List.generate(
                                                            3,
                                                            (index) => Icon(
                                                                  Icons.star,
                                                                  color:
                                                                      primaryColor,
                                                                  size: 17,
                                                                )),
                                                      ),
                                                      HorizontalSpace(10),
                                                      Text(
                                                        '10 successful campagin',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      )
                                                    ],
                                                  ),
                                                  VerticalSpace(7),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Container()),
                                                      Icon(
                                                          Icons.account_circle),
                                                      Text(
                                                        'Tadese Gelan',
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: thirdColor),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                )))
                        .toList()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// campaign
//                       .map((e) => ListView.builder(
//                           itemBuilder: ((context, index) => Container(
//                                 decoration: BoxDecoration(color: Colors.red),
//                               ))))
