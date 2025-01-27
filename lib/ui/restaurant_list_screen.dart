import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/static/restaurant_list_result_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restaurant_app/provider/list/restaurant_list_provider.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key, required this.title});

  static const routeName = '/restaurant_list';
  final String title;

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
        title: Text(widget.title),
      ),
      body: Consumer<RestaurantListProvider>(
          builder: (context, value, child) {
            return switch (value.resultState) {
              RestaurantListLoadingState() =>
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              RestaurantListLoadedState(data: var restaurantList) =>
                  ListView.builder(
                    itemCount: restaurantList.length,
                      itemBuilder: (context, index) {
                        final restaurant = restaurantList[index];

                        return Text(restaurant.name);
                      }
                  ),
              RestaurantListErrorState(error: var message) => Center(
                child: Text(message),
              ),
              _ => const SizedBox(),
            };
          }
      ),
    );
  }
}