import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class RestaurantButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;

  const RestaurantButton({this.onTap, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.blueGradient, // Gradient colors
          ),
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Adjust padding as needed
          child: Icon(
            icon,
            size: 24, // Adjust icon size
            color: Colors.white, // Icon color
          ),
        ),
      ),
    );
  }
}