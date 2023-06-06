// ignore: file_names
import 'package:flutter/material.dart';
import 'package:reliev_application/models/user.dart';

import 'counselorProfileScreen.dart';
import 'adminScreen.dart';

class AdminMainScreen extends StatefulWidget {
  final User user;
  const AdminMainScreen({super.key, required this.user});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  late List<Widget> tabchildren;
  int _currentIndex = 0;
  String maintitle = "AdminHome";
  late double screenHeight, screenWidth, resWidth;

  @override
  void initState() {
    super.initState();
    tabchildren = [
      AdminScreen(
        user: widget.user,
      ),
      CounselorProfileScreen(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }

    return Scaffold(
      body: tabchildren[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: resWidth * 0.07,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: resWidth * 0.07),
              label: "Profile"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        maintitle = "CounselorHome";
      }
      if (_currentIndex == 1) {
        maintitle = "Profile";
      }
    });
  }
}
