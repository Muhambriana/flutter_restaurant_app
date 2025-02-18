import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key, this.iconSize = 30});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.broken_image_rounded,
      color: Colors.grey,
    );
  }
}
