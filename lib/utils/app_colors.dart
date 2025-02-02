import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF4E4AF2);
  static const List<Color> blueGradient = [Color(0xFF34C8E8), primaryColor];
  static Color nonPrimaryText(BuildContext context) {
    // Adapt to the current theme (light or dark)
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white54
        : Colors.black54;
  }
}