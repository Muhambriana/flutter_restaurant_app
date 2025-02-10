import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: 'https://pikaso.cdnpk.net/private/production/1235478040/render.jpeg?token=exp=1763078400~hmac=0362c7bc4eeec5940e2e9a9030a4ef379f0ead9af96087755160b4ea4641c621',
                      placeholder: (context, url) => Center(
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: CircularProgressIndicator()
                          )
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
                          ),
                        );
                      },
                    ),
                  ),
              ),
              SizedBox(width: 5),
              Expanded(
                  flex: 2,
                  child: Column(
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
                      _place(),
                      _desc(),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
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
      icon: Icons.location_on_outlined,
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

