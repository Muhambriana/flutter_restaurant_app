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
            colors: AppColors.blueGradient,  // Example gradient colors
          ),
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Adjust padding as needed
          child: FittedBox(
            fit: BoxFit.scaleDown, // Ensures the icon scales properly
            child: Icon(
              icon,
              color: Colors.white, // Icon color
            ),
          ),
        ),
      ),
    );
  }
}
