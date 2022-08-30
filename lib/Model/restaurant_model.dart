import 'package:flutter/material.dart';
import 'package:reasa/Model/category_model.dart';

class RestaurantModel {
  String name, image, foodType;
  double deliveryFee, rating;
  int totalRatings;
  List<CategoryModel> categories;

  RestaurantModel({
    required this.name,
    required this.image,
    required this.deliveryFee,
    required this.rating,
    required this.totalRatings,
    required this.foodType,
    required this.categories,
  });

  factory RestaurantModel.fromJson(json) {
    return RestaurantModel(
      name: json['name'],
      image: json['image'],
      deliveryFee: json['deliveryFee'],
      rating: json['rating'],
      totalRatings: json['totalRatings'],
      foodType: json['foodType'],
      categories: json['categories']
          .map<CategoryModel>((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }
}
