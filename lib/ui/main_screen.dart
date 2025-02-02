import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/ui/widget/restaurant_icon.dart';
import 'package:provider/provider.dart';

import '../provider/index_nav_provider.dart';
import 'home/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavBar) {
            0 => const HomeScreen(),
            _ => const SizedBox(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context
            .watch<IndexNavProvider>()
            .indexBottomNavBar,
        onTap: (index) {
          context
              .read<IndexNavProvider>()
              .setIndexBottomNavBar = index;
        },
        items: navigationList()
      ),
    );
  }

  List<BottomNavigationBarItem> navigationList() {
    return [
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
  }
}