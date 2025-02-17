import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/api/api_services.dart';
import '../provider/detail/restaurant_detail_provider.dart';
import '../provider/bottom_nav_provider.dart';
import '../provider/list/restaurant_list_provider.dart';
import '../provider/list/search_restaurant_list_provider.dart';

class RestaurantAppProviders {
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider(
        create: (context) => BottomNavProvider(),
      ),

      Provider(create: (context) => ApiServices()),

      ChangeNotifierProvider<RestaurantListProvider>(
        create: (context) => RestaurantListProvider(context.read<ApiServices>()),
      ),

      ChangeNotifierProvider<RestaurantDetailProvider>(
        create: (context) => RestaurantDetailProvider(context.read<ApiServices>()),
      ),

      ChangeNotifierProvider<SearchRestaurantListProvider>(
        create: (context) => SearchRestaurantListProvider(context.read<ApiServices>()),
      ),
    ];
  }
}