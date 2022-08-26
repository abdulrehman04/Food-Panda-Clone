import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:reasa/Model/restaurant_model.dart';
import 'package:reasa/Services/LocationService/location_service.dart';
import 'package:reasa/constants.dart';

class AllRestaurantsViewModel extends GetxController {
  LocationService locationService = Get.find<LocationService>();
  List<RestaurantModel> restaurants = [];

  getRestaurantsFromFirebase() {
    db.collection("Restaurants").get().then((value) {
      for (var element in value.docs) {
        restaurants.add(RestaurantModel.fromJson(element.data()));
      }
    });
  }

  getRestaurantsInUserRadius() {
    geo
        .collection(
          collectionRef: db.collection("Restaurants"),
        )
        .within(
          center: geo.point(
            latitude: locationService.currentLocation.value.latitude,
            longitude: locationService.currentLocation.value.longitude,
          ),
          radius: 5,
          field: 'position',
          strictMode: true,
        )
        .listen((event) {
      for (var element in event) {
        restaurants.add(RestaurantModel.fromJson(element.data()));
      }
    });
  }
}
