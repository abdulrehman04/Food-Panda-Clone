import 'package:get/get.dart';
import 'package:reasa/View%20Models/All%20Restaurants%20View%20Model/all_restaurants_view_model.dart';

class SplashViewModel extends GetxController {
  final AllRestaurantsViewModel restaurants =
      Get.put(AllRestaurantsViewModel());

  callToGetRestaurants() {
    restaurants.getRestaurantsInUserRadius();
  }
}
