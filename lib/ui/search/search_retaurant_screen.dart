import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/provider/list/search_restaurant_list_provider.dart';
import 'package:flutter_restaurant_app/static/restaurant_list_result_state.dart';
import 'package:flutter_restaurant_app/ui/widget/restaurant/restaurant_list.dart';
import 'package:flutter_restaurant_app/ui/widget/general/error_message.dart';
import 'package:flutter_restaurant_app/ui/widget/general/loading_view.dart';
import 'package:flutter_restaurant_app/ui/widget/general/notification_button.dart';
import 'package:flutter_restaurant_app/ui/widget/general/restaurant_button.dart';
import 'package:flutter_restaurant_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restaurant_app/provider/list/restaurant_list_provider.dart';

import '../widget/general/search_bar.dart';

class SearchRestaurantScreen extends StatefulWidget {
  static const routeName = '/search_restaurant';

  const SearchRestaurantScreen({super.key});

  @override
  State<SearchRestaurantScreen> createState() => _SearchRestaurantScreenState();
}

class _SearchRestaurantScreenState extends State<SearchRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            AppBar(),
            SizedBox(height: 20,),
            Expanded(
              child: Consumer<SearchRestaurantListProvider>(
                  builder: (context, value, child) {
                    return switch (value.resultState) {
                      RestaurantListLoadingState() => LoadingView(),
                      RestaurantListErrorState(error: var message) => ErrorMessage(message: message),
                      RestaurantListLoadedState(data: var restaurantList) => RestaurantList(restaurantList: restaurantList),
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
      child:  RestaurantSearchBar(
        onQueryChanged: (query) {
          context.read<SearchRestaurantListProvider>().searchRestaurantList(query);
        },
      ),
    );
  }
}