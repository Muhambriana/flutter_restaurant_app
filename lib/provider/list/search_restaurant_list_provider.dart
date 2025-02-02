import 'package:flutter/widgets.dart';

import '../../../data/api/api_services.dart';
import '../../../static/restaurant_list_result_state.dart';

class SearchRestaurantsProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  SearchRestaurantsProvider(this._apiServices);

  String _restaurantName = "";
  RestaurantListResultState _resultState = RestaurantListNoneState();

  String get restaurantName => _restaurantName;
  RestaurantListResultState get resultState => _resultState;

  Future<void> searchRestaurantList(String restaurantName) async {
    try {

      _restaurantName = restaurantName;
      if (restaurantName.isEmpty) {
        notifyListeners();
        return;
      }

      _resultState = RestaurantListLoadingState();
      notifyListeners();

      final result = await _apiServices.searchRestaurants(restaurantName);

      if (result.error) {
        _resultState = RestaurantListErrorState(result.error.toString());
        notifyListeners();
      } else {
        _resultState = RestaurantListLoadedState(result.restaurantList);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantListErrorState(e.toString());
      notifyListeners();
    }
  }
}
