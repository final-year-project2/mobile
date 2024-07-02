// import 'dart:js_interop';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/controller/detail_controler.dart';
import 'package:frontend/controller/ticket_controller.dart';
import 'package:frontend/models/ticket_model.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:frontend/widgets/ticket.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const _pageSize = 20;

  List campaign = [
    'First',
    'Second',
    'Third',
    'Third',
    'Third',
  ];

  RxInt currentIndex = 0.obs;
  Widget tabBarContent = Container();
  List tabBarList = [
    'All',
    'Electronics',
    'Car',
    'Home',
    'Others',
  ];

  late TabController tabController;
  RxInt testvalue = 0.obs;
  final ticketController = Get.find<TicketController>();
  final Detailcontroler = Get.find<DetailControler>();
  @override
  void dispose() {
    tabController.removeListener(handelevent);
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: tabBarList.length, vsync: this);

    currentIndex.listen((newindex) {
      print('newindex$newindex');
    });
    tabController.addListener(handelevent);
    super.initState();
  }

  void handelevent() {
    currentIndex.value = tabController.index;
    print('currentIndexxx$currentIndex');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context);

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
            child: Container(
              width: double.infinity,
              height: 500,
              child: TabBarView(
                controller: tabController,
                children: ticketController.tabs.map((tab) {
                  final pagingController =
                      ticketController.pagingControllers[tab];

                  // if (ticketController.pagingControllers[tab] == null) {
                  //   ticketController.pagingControllers[tab] =
                  //       PagingController(firstPageKey: 0);
                  // }
                  return RefreshIndicator(
                    onRefresh: () async {
                      await ticketController.refreshTickets(tab);
                    },
                    child: PagedListView<int, TicketModel>(
                      pagingController: pagingController!,
                      builderDelegate: PagedChildBuilderDelegate<TicketModel>(
                        itemBuilder: (context, item, index) {
                          return GestureDetector(
                            onTap: () {
                              Detailcontroler.Ticket.value = {
                                "id": item.id,
                                "seller": item.seller,
                                "title": item.title,
                                "description": item.description,
                                "numberOfTickets": item.numberOfTickets,
                                "prizeCategories": item.prizeCategories,
                                "price_of_ticket": item.priceOfTicket,
                                "image1": item.image1,
                                "image2": item.image2,
                                "image3": item.image3
                              };
                              Get.toNamed('detailpage');
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 15),
                              child: Ticket(
                                progessValue:
                                    ticketController.normalizeNumberOfUser(
                                        item.numberOfBuyer.toString(),
                                        item.numberOfTickets),
                                imageUri: item.image1,
                                numberOfBuyers: item.numberOfBuyer
                                    .toString(), // Placeholder value
                                title: item.title ??
                                    'No Title', // Provide a fallback value
                                ticketLeft: item.ticketLeft
                                    .toString(), // Placeholder value
                                totalTicket:
                                    item.numberOfTickets, // Placeholder value
                                successfulCampaign: '2', // Placeholder value
                                sellerName: 'item.seller ' ??
                                    'Unknown Seller', // Provide a fallback value
                              ),
                            ),
                          );
                        },
                        firstPageErrorIndicatorBuilder: (context) => Center(
                          child: Text('Error loading first page'),
                        ),
                        noItemsFoundIndicatorBuilder: (context) => Center(
                          child: Text('No items found'),
                        ),
                      ),
                    ),
                  );
                }).toList(),
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
