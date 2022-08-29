import 'package:reasa/Model/category_item_model.dart';
import 'package:reasa/Model/category_model.dart';
import 'package:reasa/Model/restaurant_model.dart';

List dummyRestaurants = [
  RestaurantModel(
    name: "Restaurant 1",
    image: 'restaurant1.jpeg',
    deliveryFee: 47.5,
    rating: 4.3,
    totalRatings: 100,
    foodType: "Pakistani",
  ),
  RestaurantModel(
    name: "Restaurant 2",
    image: 'restaurant2.jpeg',
    deliveryFee: 55.5,
    rating: 4.3,
    totalRatings: 88,
    foodType: "Chinese",
  ),
  RestaurantModel(
    name: "Restaurant 3",
    image: 'restaurant3.jpeg',
    deliveryFee: 150,
    rating: 4.8,
    totalRatings: 650,
    foodType: "Italian",
  ),
];

List<CategoryModel> dummyRestaurantDetails = [
  CategoryModel(
    categoryName: "Category 1",
    categoryItems: [
      CategoryItemModel(
        name: "Food 1",
        image: 'assets/Foods/food1.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 2",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 3",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
    ],
  ),
  CategoryModel(
    categoryName: "Category 2",
    categoryItems: [
      CategoryItemModel(
        name: "Food 1",
        image: 'assets/Foods/food1.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 2",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 3",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
    ],
  ),
  CategoryModel(
    categoryName: "Category 3",
    categoryItems: [
      CategoryItemModel(
        name: "Food 1",
        image: 'assets/Foods/food1.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 2",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 3",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
    ],
  ),
  CategoryModel(
    categoryName: "Category 4",
    categoryItems: [
      CategoryItemModel(
        name: "Food 1",
        image: 'assets/Foods/food1.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 2",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 3",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
    ],
  ),
  CategoryModel(
    categoryName: "Category 5",
    categoryItems: [
      CategoryItemModel(
        name: "Food 1",
        image: 'assets/Foods/food1.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 2",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 3",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
    ],
  ),
  CategoryModel(
    categoryName: "Category 6",
    categoryItems: [
      CategoryItemModel(
        name: "Food 1",
        image: 'assets/Foods/food1.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 2",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
      CategoryItemModel(
        name: "Food 3",
        image: 'assets/Foods/food3.png',
        desc: "Some good food",
        price: 14.99,
      ),
    ],
  ),
];
