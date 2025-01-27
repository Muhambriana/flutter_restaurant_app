import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/data/api/api_services.dart';
import 'package:flutter_restaurant_app/provider/list/restaurant_list_provider.dart';
import 'package:flutter_restaurant_app/util.dart';
import 'package:flutter_restaurant_app/static/routes.dart';
import 'package:flutter_restaurant_app/utils/strings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
            create: (context) => ApiServices(),
        ),
        ChangeNotifierProvider<RestaurantListProvider>(
          create: (context) {
            final apiServices = context.read<ApiServices>();
            return RestaurantListProvider(apiServices);
          },
        ),
      ],
      child: const RestaurantApp(),
    ),
  );
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
      initialRoute: Routes.restaurantList,
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


