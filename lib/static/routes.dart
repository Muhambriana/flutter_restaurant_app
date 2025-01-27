import 'package:flutter/material.dart';
import '../ui/restaurant_list_screen.dart';

class Routes {
  static const restaurantList = RestaurantListScreen.routeName;

  static Map<String, WidgetBuilder> get routes => {
    RestaurantListScreen.routeName: (context) => const RestaurantListScreen(title: 'Restaurant'),
  };
}