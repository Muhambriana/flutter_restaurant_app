import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/data/model/restaurant.dart';
import 'package:flutter_restaurant_app/ui/widget/restaurant/restaurant_card.dart';

import '../../detail/restaurant_detail_screen.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key, required this.restaurantList});

  final List<Restaurant> restaurantList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: restaurantList.length,  // Use the correct variable here
      itemBuilder: (context, index) {
        final restaurant = restaurantList[index];  // Use the correct variable here

        return RestaurantCard(
          onTap: () {
            // Navigate to detail
            Navigator.pushNamed(
              context,
              RestaurantDetailScreen.routeName,
              arguments: restaurant.id, // Pass restaurant ID
            );
          },
          restaurant: restaurant,
        );
      },
    );
  }
}

