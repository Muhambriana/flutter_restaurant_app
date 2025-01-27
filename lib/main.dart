import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/util.dart';
import 'package:flutter_restaurant_app/utils/routes.dart';
import 'package:flutter_restaurant_app/utils/strings.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: Strings.appName,
      theme: _buildTheme(context, Brightness.light, Colors.blue),
      darkTheme: _buildTheme(context, Brightness.dark, Colors.cyan),
      themeMode: ThemeMode.system,
      initialRoute: Routes.home,
      routes: Routes.routes,
    );
  }

  ThemeData _buildTheme(BuildContext context, Brightness brightness, Color seedColor) {
    final textTheme = createTextTheme(context, "Poppins", "Poppins");

    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );

    return ThemeData(
      brightness: brightness,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      colorScheme: colorScheme,
      useMaterial3: true,
    );
  }
}


