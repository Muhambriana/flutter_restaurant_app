import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/data/api/network_info.dart';
import 'package:flutter_restaurant_app/data/model/restaurant.dart';
import 'package:flutter_restaurant_app/utils/app_colors.dart';

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
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: _restaurantImageItem(),
              ),
              SizedBox(width: 10),
              Expanded(
                  flex: 2,
                  child: _restaurantContentItem(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _restaurantImageItem() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        imageUrl: '${NetworkInfo.baseUrlImage}/${restaurant.pictureId}',
        placeholder: (context, url) => Center(
            child: Padding(
                padding: EdgeInsets.all(5),
                child: CircularProgressIndicator()
            )
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.broken_image_rounded,
          color: Colors.grey,
          size: 30,
        ),
      ),
    );
  }

  Widget _restaurantContentItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  restaurant.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: _rating()
            ),
          ],
        ),
        SizedBox(height: 10,),
        _place(),
        _desc(),
      ],
    );
  }


  Widget _rating() {
    return IconAndText(
      text: restaurant.rating.toString(),
      icon: Icons.star_rate_rounded,
      color: Colors.amber,
    );
  }

  Widget _place() {
    return IconAndText(
      text: restaurant.city,
      icon: Icons.pin_drop,
    );
  }

  Widget _desc() {
    return IconAndText(
        text: restaurant.description,
        icon: Icons.short_text_rounded,
    );
  }

}

class IconAndText extends StatelessWidget {
  const IconAndText({
    super.key,
    required this.text,
    required this.icon,
    this.color,
  });

  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          // If color not set, then give default value
          color: color ?? AppColors.primaryColor,
        ),
        Expanded(
          flex: 1,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: AppColors.nonPrimaryText(context),
                fontSize: 15
            ),
          ),
        )
      ],
    );
  }
}

