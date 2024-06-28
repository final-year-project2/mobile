import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/authentication/login.dart';
import 'package:frontend/pages/seller/product_description.dart';
import 'package:frontend/pages/mainscreens/homepage.dart';
import 'package:frontend/pages/mainscreens/wallet/add_money_to_wallet.dart';
import 'package:frontend/pages/mainscreens/wallet/success.dart';
import 'package:frontend/pages/mainscreens/wallet/wallet.dart';
// import 'package:frontend/pages/mainscreens/profile.dart';
import 'package:frontend/pages/mainscreens/profile.dart';
import 'package:frontend/pages/seller/seller_Registration.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  

  List<Widget> pages = [HomePage(), SellerRegistrationPage(), Wallet()];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) => {
          setState(() {
            currentPage = value;
          })
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
        ],
      ),
    );
  }
}
