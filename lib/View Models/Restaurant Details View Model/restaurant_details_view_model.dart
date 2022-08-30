import 'package:get/get.dart';
import 'package:reasa/Model/restaurant_model.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';

class RestaurantDetailsViewModel extends GetxController {
  late RestaurantModel currentRestaurant;

  CartViewModel cart = Get.put(CartViewModel());
}
