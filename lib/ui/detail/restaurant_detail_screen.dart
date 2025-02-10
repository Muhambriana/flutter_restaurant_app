import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:flutter_restaurant_app/static/restaurant_detail_result_state.dart';
import 'package:flutter_restaurant_app/ui/widget/general/error_message.dart';
import 'package:flutter_restaurant_app/ui/widget/general/loading_view.dart';
import 'package:provider/provider.dart';

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
      context.read<RestaurantDetailProvider>().fetchRestaurantDetail(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RestaurantDetailScreen.title),
      ),
      body: Consumer<RestaurantDetailProvider>(
          builder: (context, value, child) {
            return switch (value.resultState) {
              RestaurantDetailLoadingState() => LoadingView(),
              RestaurantDetailErrorState(error: var message) => ErrorMessage(message: message),
              RestaurantDetailLoadedState(data: var restaurant) => Text(restaurant.name),
              _ => SizedBox()
            };
          }
      ),
    );
  }
}