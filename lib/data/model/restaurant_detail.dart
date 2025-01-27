import 'category.dart';
import 'customer_review.dart';
import 'menu.dart';

class RestaurantDetail {
  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<Category> categoryList;
  MenuList menuList;
  double rating;
  List<CustomerReview> customerReviewList;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categoryList,
    required this.menuList,
    required this.rating,
    required this.customerReviewList,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) => RestaurantDetail(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    address: json["address"],
    pictureId: json["pictureId"],
    categoryList: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    menuList: MenuList.fromJson(json["menus"]),
    rating: json["rating"]?.toDouble(),
    customerReviewList: List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "city": city,
    "address": address,
    "pictureId": pictureId,
    "categories": List<dynamic>.from(categoryList.map((x) => x.toJson())),
    "menus": menuList.toJson(),
    "rating": rating,
    "customerReviews": List<dynamic>.from(customerReviewList.map((x) => x.toJson())),
  };
}
