import 'package:flutter/material.dart';
import '../ui/home_screen.dart';

class Routes {
  static const home = HomePage.routeName;

  static Map<String, WidgetBuilder> get routes => {
    HomePage.routeName: (context) => const HomePage(title: 'Home'),
  };
}