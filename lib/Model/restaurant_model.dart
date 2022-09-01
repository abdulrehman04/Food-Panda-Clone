import 'package:reasa/Model/category_model.dart';

class RestaurantModel {
  String name, image, foodType, id;
  double deliveryFee, rating;
  int totalRatings;
  List<CategoryModel> categories;

  RestaurantModel({
    required this.name,
    required this.id,
    required this.image,
    required this.deliveryFee,
    required this.rating,
    required this.totalRatings,
    required this.foodType,
    required this.categories,
  });

  factory RestaurantModel.fromJson(json, id) {
    return RestaurantModel(
      id: id,
      name: json['name'],
      image: json['image'],
      deliveryFee: json['deliveryFee'],
      rating: json['rating'],
      totalRatings: json['totalRatings'],
      foodType: json['foodType'],
      categories: json['categories']
          .map<CategoryModel>((e) => CategoryModel.fromJson(e['data'], e['id']))
          .toList(),
    );
  }
}
