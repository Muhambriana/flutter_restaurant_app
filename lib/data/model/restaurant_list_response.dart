import 'package:flutter_restaurant_app/data/model/restaurant.dart';
import 'dart:convert';

RestaurantListResponse restaurantListResponseFromJson(String str) => RestaurantListResponse.fromJson(json.decode(str));

// String restaurantListResponseToJson(RestaurantListResponse data) => json.encode(data.toJson());

class RestaurantListResponse {
  bool error;
  String message;
  int count;
  List<Restaurant> restaurantList;

  RestaurantListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurantList,
  });

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) => RestaurantListResponse(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurantList: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );
  //
  // Map<String, dynamic> toJson() => {
  //   "error": error,
  //   "message": message,
  //   "count": count,
  //   "restaurants": List<dynamic>.from(restaurantList.map((x) => x.toJson())),
  // };
}
