import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:reliev_application/models/user.dart';
import 'counselorScreen.dart';
import 'homeScreen.dart';
import 'profileScreen.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget? _child;

  @override
  void initState() {
    _child = HomeScreen(user: widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      extendBody: true,
      body: _child,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              icon: Icons.info_outline,
              backgroundColor: Colors.purpleAccent,
              extras: {"label": "Counselors"}),
          FluidNavBarIcon(
              icon: Icons.home,
              backgroundColor: const Color(0xFFEC4134),
              extras: {"label": "home"}),
          FluidNavBarIcon(
              icon: Icons.person,
              backgroundColor: Colors.blueAccent,
              extras: {"label": "Profile"}),
        ],
        onChange: _handleNavigationChange,
        style:
            const FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
        scaleFactor: 1,
        defaultIndex: 1,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = CounselorScreen(
            user: widget.user,
          );
          break;
        case 1:
          _child = HomeScreen(
            user: widget.user,
          );
          break;
        case 2:
          _child = ProfileScreen(user: widget.user);
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 200),
        child: _child,
      );
    });
  }
}
