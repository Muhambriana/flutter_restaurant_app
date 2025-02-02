import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/data/model/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.onTap,
    required this.restaurant
  });

  final Function() onTap;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.green,
        child: Text(restaurant.name, style: TextStyle(fontSize: 50),),
      ),
    );
  }
}
