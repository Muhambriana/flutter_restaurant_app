import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/ui/widget/general/restaurant_button.dart';

class BackButtonRestaurant extends StatelessWidget {
  const BackButtonRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return RestaurantButton(
      onTap: Navigator.of(context).pop,
      icon: Icons.arrow_back_ios_new,
    );
  }
}