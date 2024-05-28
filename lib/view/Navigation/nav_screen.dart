import 'package:app_neu_social/utils/color_constant/color_constant.dart';
import 'package:app_neu_social/view/community_screen/community_screen.dart';
import 'package:app_neu_social/view/event_screen/event_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;
  List<Widget> Screens = [EventScreen(), CommunityScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          backgroundColor: ColorConstant.white,
          selectedItemColor: ColorConstant.DefaultBlue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
            BottomNavigationBarItem(
                icon: Icon(Icons.groups), label: "Communities"),
          ]),
    );
  }
}
