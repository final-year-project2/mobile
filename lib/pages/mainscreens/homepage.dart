// import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/ticket_controller.dart';
import 'package:frontend/models/ticket_model.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/ticket.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ticketController = Get.find<TicketController>();
  Widget tabBarContent = Container();

  List tabBarList = [
    'All',
    'Electronics',
    'Car',
    'Home',
    'Others',
  ];
  List campaign = [
    'First',
    'Second',
    'Third',
    'Third',
    'Third',
  ];

  late TabController tabController;
  RxInt currentIndex = 0.obs;
  RxInt testvalue = 0.obs;

  void handelevent() {
    currentIndex.value = tabController.index;
    print('currentIndexxx$currentIndex');
  }

  @override
  void initState() {
    super.initState();
    final TabController tabController =
        TabController(length: tabBarList.length, vsync: this);
    currentIndex.listen((newindex) {
      print('newindex$newindex');
    });
    tabController.addListener(handelevent);
  }

  @override
  void dispose() {
    tabController.removeListener(handelevent);
    tabController.dispose();
    super.dispose();
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
                  indicatorColor: Colors.amberAccent,
                  onTap: (value) async {
                    currentIndex.value = tabController.index;
                  },
                  // unselectedLabelStyle: TextStyle(color: Colors.red),
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
                      (index) => Obx(() {
                            print('Current index$currentIndex');
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: currentIndex == index
                                      ? primaryColor
                                      : Color.fromRGBO(224, 224, 224, 1)),
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Text(
                                  tabBarList[index],
                                  style: TextStyle(
                                      color: currentIndex.value == index
                                          ? Colors.black
                                          : Color.fromRGBO(130, 130, 130, 1)),
                                ),
                              )),
                            );
                          }))),
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
                    children: ticketController.tabData.entries.map((entry) {
                      int tabIndex = entry.key
                          .hashCode; // Use hashCode to uniquely identify tabs
                      Widget tabBarContent = Container();

                      // Access the data for the current tab
                      List<TicketModel> data = entry.value;

                      // Check if data exists for the current tab
                      if (data.isNotEmpty) {
                        tabBarContent = ListView.builder(
                          itemCount:
                              data.length, // Use the length of the data list
                          itemBuilder: (context, index) {
                            // Extract properties from the TicketModel for display
                            String title = data[index].title ??
                                'No Title'; // Provide a fallback value
                            String sellerName =
                                data[index].seller ?? 'Unknown Seller';

                            String ticketLeft = data[index].numberOfTickets;
                            String imageUri = data[index].image1;

                            // Provide a fallback value
                            // Add more properties as needed

                            return Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 15),
                              child: Ticket(
                                imageUri: imageUri,
                                numberOfBuyers: '300', // Placeholder value
                                title: title,
                                ticketLeft: ticketLeft, // Placeholder value
                                totalTicket: ticketLeft, // Placeholder value
                                successfulCampaign: '2', // Placeholder value
                                sellerName: sellerName,
                              ),
                            );
                          },
                        );
                      } else {
                        tabBarContent = Center(
                            child: Text(
                                'No data available for this tab.')); // Display a message if no data
                      }

                      return GestureDetector(
                          onTap: () {
                            Get.toNamed('detailpage');
                          },
                          child: tabBarContent);
                    }).toList(),
                  )),
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
