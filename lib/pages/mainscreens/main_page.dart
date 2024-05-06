import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/authentication/login.dart';
import 'package:frontend/pages/landing_page.dart';
import 'package:frontend/pages/mainscreens/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [const HomePage(), LandingPage(), Login()];
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
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
        ],
      ),
    );
  }
}
