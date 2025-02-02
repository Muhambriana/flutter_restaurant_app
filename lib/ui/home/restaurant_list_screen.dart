import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/data/model/restaurant.dart';
import 'package:flutter_restaurant_app/static/restaurant_list_result_state.dart';
import 'package:flutter_restaurant_app/ui/detail/restaurant_detail_screen.dart';
import 'package:flutter_restaurant_app/ui/widget/restaurant_list.dart';
import 'package:flutter_restaurant_app/ui/widget/error_message.dart';
import 'package:flutter_restaurant_app/ui/widget/loading_view.dart';
import 'package:flutter_restaurant_app/ui/widget/notification_button.dart';
import 'package:flutter_restaurant_app/ui/widget/restaurant_button.dart';
import 'package:flutter_restaurant_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restaurant_app/provider/list/restaurant_list_provider.dart';

class RestaurantListScreen extends StatefulWidget {
  static const routeName = '/restaurant_list';
  static const title = 'List';

  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            AppBar(),
            Expanded(
              child: Consumer<RestaurantListProvider>(
                  builder: (context, value, child) {
                    return switch (value.resultState) {
                      RestaurantListLoadingState() => LoadingView(),
                      RestaurantListErrorState(error: var message) => ErrorMessage(message: message),
                      RestaurantListLoadedState(data: var restaurantList) => RestaurantList(listRestaurant: restaurantList),
                      _ => const SizedBox(),
                    };
                  }
              )
            ),
          ],
        ),
      )
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RestaurantButton(
              icon: Icons.dashboard_outlined,
          ),
          _userLocation(context),
          NotificationButton(
            onTap: () {},
            hasUnreadNotifications: true,
          ),
        ],
      ),
    );
  }
  
  Widget _userLocation(BuildContext context) {
    return Column(
      children: [
        Text(
          'Location',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              color: AppColors.nonPrimaryText(context)
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.primaryColor,
            ),
            Text(
              'Jakarta, Indonesia',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}