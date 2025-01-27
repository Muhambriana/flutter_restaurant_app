import 'category.dart';

class MenuList {
  List<Category> foods;
  List<Category> drinks;

  MenuList({
    required this.foods,
    required this.drinks,
  });

  factory MenuList.fromJson(Map<String, dynamic> json) => MenuList(
    foods: List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
    drinks: List<Category>.from(json["drinks"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}