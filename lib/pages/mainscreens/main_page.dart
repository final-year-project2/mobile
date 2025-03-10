// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:frontend/constants.dart';
// import 'package:frontend/pages/authentication/login.dart';
// import 'package:frontend/pages/seller/dashboard.dart';
// import 'package:frontend/pages/seller/product_description.dart';
// import 'package:frontend/pages/mainscreens/homepage.dart';
// import 'package:frontend/pages/mainscreens/wallet/add_money_to_wallet.dart';
// import 'package:frontend/pages/mainscreens/wallet/success.dart';
// import 'package:frontend/pages/mainscreens/wallet/wallet.dart';
// import 'package:frontend/pages/mainscreens/profile.dart';
// import 'package:frontend/pages/seller/seller_Registration.dart';
// import 'package:frontend/controller/UserController.dart';
// import 'package:get/get.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   final checker = Get.find<UserController>();
//   final sellerId = Get.find<UserController>();
//   List<Widget> pages = [];
//   int currentPage = 0;

//   @override
//   void initState() {
//     super.initState();

//     print("sellernwgen :${checker.isSeller}");

//     String userId = sellerId.userId.value;

//     checker.checkIfUserIsSeller(userId).then((_) {
//       // updatePages();
//       // setState(() {}); // Trigger rebuild after updating pages
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     pages = [HomePage(), SellerRegistrationPage(), Wallet(), Dashboard()];

//     // if (checker.isSeller.value) {
//     //   pages.add(Dashboard());
//     // } else {
//     //   pages.remove(Dashboard());
//     // }

//     // // Ensure currentPage is within the valid range after updating pages
//     // if (currentPage >= pages.length) {
//     //   currentPage = pages.length - 1;
//     // }

//     List<BottomNavigationBarItem> items = [
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//       BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
//       BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.dashboard),
//         label: "Dashboard",
//       )
//     ];

//     if (checker.isSeller.value) {
//       items.add(BottomNavigationBarItem(
//         icon: Icon(Icons.dashboard),
//         label: "Dashboard",
//       ));
//     } else {
//       items.remove(BottomNavigationBarItem(
//         icon: Icon(Icons.dashboard),
//         label: "Dashboard",
//       ));
//     }

//     // return
//     // updatePages(); // Ensure pages are updated before building the UI

//     return Scaffold(
//       body: pages[currentPage],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: primaryColor,
//         unselectedItemColor: Colors.grey,
//         currentIndex: currentPage,
//         onTap: (value) async {
//           if (value == 1) {
//             try {
//               String userId = sellerId.userId.value;
//               bool isSeller = await checker.checkIfUserIsSeller(userId);
//               if (isSeller) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProductDesciption()),
//                 );
//               } else {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SellerRegistrationPage()),
//                 );
//               }
//             } catch (e) {
//               print('Error checking user status: $e');
//             }
//           } else {
//             setState(() {
//               currentPage = value;
//               // Ensure currentPage is within the valid range after updating pages
//               // if (currentPage >= pages.length) {
//               //   currentPage = pages.length - 1;
//               // }
//             });
//           }
//         },
//         items: items,
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/pages/authentication/login.dart';
import 'package:frontend/pages/merchant_registration/merchant_legal_info.dart';

import 'package:frontend/pages/seller/dashboard.dart';
import 'package:frontend/pages/seller/product_description.dart';

import 'package:frontend/pages/mainscreens/homepage.dart';
import 'package:frontend/pages/mainscreens/wallet/add_money_to_wallet.dart';
import 'package:frontend/pages/mainscreens/wallet/success.dart';
import 'package:frontend/pages/mainscreens/wallet/wallet.dart';
import 'package:frontend/pages/mainscreens/profile.dart';
import 'package:frontend/pages/seller/seller_Registration.dart';
import 'package:frontend/pages/seller/product_description.dart';
import 'package:frontend/controller/UserController.dart';

import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final checker = Get.find<UserController>();
  final sellerId = Get.find<UserController>();
  List<Widget> pages = [const HomePage(), Container(), Wallet(), Dashboard()];

  // List<Widget> pages = [
  //   HomePage(),
  //   SellerRegistrationPage(),
  //   Wallet(),
  //   Dashboard(),
  // ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor, // Set the selected item color
        unselectedItemColor: Colors.grey,
        currentIndex: currentPage,
        onTap: (value) async {
          if (value == 1) {
            try {
              String userId = sellerId.userId.value;
              bool isSeller = await checker.checkIfUserIsSeller(userId);
              if (isSeller) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDesciption()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MerchantLegalInfo()),
                );
              }
            } catch (e) {
              // Handle any errors here, such as showing an error message
              print('Error checking user status: $e');
            }
          } else {
            setState(() {
              currentPage = value;
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: "Dashboard"),
        ],
      ),
    );
  }
}
