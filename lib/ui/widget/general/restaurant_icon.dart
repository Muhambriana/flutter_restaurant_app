import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant_app/utils/app_colors.dart';

class RestaurantIcon extends StatelessWidget {
  const RestaurantIcon(this.iconData, {super.key});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: AppColors.primaryColor,
    );
  }
}
