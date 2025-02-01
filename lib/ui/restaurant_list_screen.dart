import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/data/model/restaurant.dart';
import 'package:flutter_restaurant_app/static/restaurant_list_result_state.dart';
import 'package:flutter_restaurant_app/ui/restaurant_detail_screen.dart';
import 'package:flutter_restaurant_app/ui/widget/error_message.dart';
import 'package:flutter_restaurant_app/ui/widget/loading_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restaurant_app/provider/list/restaurant_list_provider.dart';

class RestaurantListScreen extends StatefulWidget {
  static const routeName = '/restaurant_list';
  static const title = 'List';

  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {

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
        title: Text(RestaurantListScreen.title),
      ),
      body: Consumer<RestaurantListProvider>(
          builder: (context, value, child) {
            return switch (value.resultState) {
              RestaurantListLoadingState() => LoadingView(),
              RestaurantListErrorState(error: var message) => ErrorMessage(message: message),
              RestaurantListLoadedState(data: var restaurantList) => _listView(restaurantList),
              _ => const SizedBox(),
            };
          }
      ),
    );
  }

  Widget _listView (List<Restaurant> restaurantList) {
    return ListView.builder(
      itemCount: restaurantList.length,
      itemBuilder: (context, index) {
        final restaurant = restaurantList[index];

        return ListTile(
          title: Text(restaurant.name),
          onTap: () {
            // Navigate to detail
            Navigator.pushNamed(
              context,
              RestaurantDetailScreen.routeName,
              arguments: restaurant.id, // Pass restaurant ID
            );
          },
        );
      },
    );
  }
}