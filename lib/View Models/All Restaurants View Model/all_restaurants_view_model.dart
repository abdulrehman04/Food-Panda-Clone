import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:reasa/Model/restaurant_model.dart';
import 'package:reasa/constants.dart';

class AllRestaurantsViewModel extends GetxController {
  List<RestaurantModel> restaurants = [];

  getRestaurantsFromFirebase() {
    db.collection("Restaurants").get().then((value) {
      for (var element in value.docs) {
        restaurants.add(RestaurantModel.fromJson(element.data()));
      }
    });
  }
}
