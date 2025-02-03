import 'package:flutter/material.dart';
import '../ui/detail/restaurant_detail_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/main_screen.dart';

class Routes {
  static const mainScreen = MainScreen.routeName;

  static Map<String, WidgetBuilder> get routes => {
    MainScreen.routeName: (context) => MainScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(
      restaurantId: ModalRoute.of(context)?.settings.arguments as String,
    ),
  };
}