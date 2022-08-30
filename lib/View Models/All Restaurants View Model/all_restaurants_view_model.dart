import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:reasa/Model/restaurant_model.dart';
import 'package:reasa/Services/LocationService/location_service.dart';
import 'package:reasa/UI/Dashboard/Restaurant%20Details/restaurant_details.dart';
import 'package:reasa/View%20Models/Restaurant%20Details%20View%20Model/restaurant_details_view_model.dart';
import 'package:reasa/constants.dart';

class AllRestaurantsViewModel extends GetxController {
  LocationService locationService = Get.find<LocationService>();
  RestaurantDetailsViewModel restaurantDetails =
      Get.put(RestaurantDetailsViewModel());

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
          radius: 50,
          field: 'position',
          strictMode: true,
        )
        .listen((event) async {
      for (DocumentSnapshot element in event) {
        List categories = [];
        Map restaurantData = Map.from(element.data() as Map);
        for (String e in element['categories']) {
          var data = await db.collection("Categories and Foods").doc(e).get();
          categories.add(data.data());
        }
        restaurantData['categories'] = categories;
        restaurants.add(RestaurantModel.fromJson(restaurantData));
      }
    });
  }

  navigateToRestaurant(RestaurantModel e) {
    restaurantDetails.currentRestaurant = e;
    Get.to(() => const RestaurantDetails());
  }
}
