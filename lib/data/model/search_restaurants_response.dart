import 'package:flutter_restaurant_app/data/model/restaurant.dart';
import 'dart:convert';

SearchRestaurantsResponse restaurantListResponseFromJson(String str) => SearchRestaurantsResponse.fromJson(json.decode(str));

class SearchRestaurantsResponse {
  bool error;
  int founded;
  List<Restaurant> restaurantList;

  SearchRestaurantsResponse({
    required this.error,
    required this.founded,
    required this.restaurantList,
  });

  factory SearchRestaurantsResponse.fromJson(Map<String, dynamic> json) => SearchRestaurantsResponse(
    error: json["error"],
    founded: json["founded"],
    restaurantList: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );
}
