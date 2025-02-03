import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/ui/widget/restaurant_icon.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_nav_provider.dart';
import 'home/home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  static const routeName = '/main';

  final List<Widget> screenList  = [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
  ];

  final List<BottomNavigationBarItem> bottomNavList = [
    BottomNavigationBarItem(
      icon: RestaurantIcon(Icons.home_outlined),
      label: "Home",
      tooltip: "Click to see restaurant list",
    ),
    BottomNavigationBarItem(
      icon: RestaurantIcon(Icons.person_outline_rounded),
      label: "Profile",
      tooltip: "Click to personalize your profile",
    ),
    BottomNavigationBarItem(
      icon: RestaurantIcon(Icons.bookmarks_outlined),
      label: "Bookmarks",
      tooltip: "Click to see bookmark list",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
        builder: (context, value, child) => Scaffold(
          body: PageView(
            controller: value.pageController,
            onPageChanged: value.onPageChanged,
            children: screenList,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.selectedIndex,
            onTap: value.onTap,
            items: bottomNavList,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            tooltip: 'Search Restaurant',
            child: RestaurantIcon(Icons.search_rounded),
          ),
        )
    );
  }
}