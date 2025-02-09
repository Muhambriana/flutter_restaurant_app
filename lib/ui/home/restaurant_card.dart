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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    restaurant.name, style: TextStyle(fontSize: 20),
                  )
              ),
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
                                  'Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Text('Rating')
                          ),
                        ],
                      ),
                      Text('Place'),
                      Text('Desc'),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
