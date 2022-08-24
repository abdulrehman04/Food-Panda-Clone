class RestaurantModel {
  String name, image, foodType;
  double deliveryFee, rating, totalRatings;

  RestaurantModel({
    required this.name,
    required this.image,
    required this.deliveryFee,
    required this.rating,
    required this.totalRatings,
    required this.foodType,
  });
}
