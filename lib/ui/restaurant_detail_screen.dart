import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/static/restaurant_list_result_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restaurant_app/provider/list/restaurant_list_provider.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final String restaurantId;

  static const routeName = '/restaurant_detail';
  static const title = 'Detail';

  const RestaurantDetailScreen({super.key, required this.restaurantId});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RestaurantDetailScreen.title),
      ),
      body: Text(widget.restaurantId),
    );
  }
}