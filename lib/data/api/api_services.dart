import 'dart:convert';

import 'package:flutter_restaurant_app/data/api/network_info.dart';
import 'package:flutter_restaurant_app/data/model/restaurant_detail_response.dart';
import 'package:flutter_restaurant_app/data/model/restaurant_list_response.dart';
import 'package:flutter_restaurant_app/data/model/search_restaurants_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String _baseUrl = NetworkInfo.baseUrl;

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load list restaurant');
    }
  }

  Future<SearchRestaurantsResponse> searchRestaurants(String restaurantName) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$restaurantName"));

    if (response.statusCode == 200) {
      return SearchRestaurantsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load list restaurant');
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String restaurantId) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$restaurantId"));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load detail restaurant');
    }
  }
}