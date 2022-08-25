class RestaurantModel {
  String name, image, foodType;
  double deliveryFee, rating;
  int totalRatings;

  RestaurantModel({
    required this.name,
    required this.image,
    required this.deliveryFee,
    required this.rating,
    required this.totalRatings,
    required this.foodType,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json['name'],
      image: json['image'],
      deliveryFee: json['deliveryFee'],
      rating: json['rating'],
      totalRatings: json['totalRatings'],
      foodType: json['foodType'],
    );
  }
}
