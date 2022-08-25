import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Restaurants/Restaurant%20Components/restaurant_app_bar.dart';
import 'package:reasa/UI/Dashboard/Restaurants/Restaurant%20Components/restaurant_item.dart';
import 'package:reasa/UI/Dashboard/Restaurants/Restaurant%20Components/restaurants_under_a_category.dart';
import 'package:reasa/View%20Models/All%20Restaurants%20View%20Model/all_restaurants_view_model.dart';
import 'package:reasa/dummy_data.dart';
import 'package:reasa/widgets.dart';

class Restaurants extends StatelessWidget {
  Restaurants({Key? key}) : super(key: key);

  final AllRestaurantsViewModel restaurants =
      Get.put(AllRestaurantsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: restaurantAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230.h,
              child: RestaurantsUnderACategory(
                title: "Home chef Food fest week",
                restaurants: [
                  dummyRestaurants[0],
                  dummyRestaurants[1],
                  dummyRestaurants[2],
                  dummyRestaurants[1],
                  dummyRestaurants[0],
                ],
              ),
            ),
            SizedBox(
              height: 230.h,
              child: RestaurantsUnderACategory(
                title: "Pandapicks",
                restaurants: [
                  dummyRestaurants[1],
                  dummyRestaurants[0],
                  dummyRestaurants[1],
                  dummyRestaurants[2],
                  dummyRestaurants[0],
                ],
              ),
            ),
            SizedBox(
              height: 230.h,
              child: RestaurantsUnderACategory(
                title: "Panda exclusives",
                restaurants: [
                  dummyRestaurants[2],
                  dummyRestaurants[1],
                  dummyRestaurants[0],
                  dummyRestaurants[2],
                  dummyRestaurants[0],
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: heading1("All restaurants"),
            ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              children: restaurants.restaurants.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: restaurantItem(
                    e,
                    fullSize: true,
                    dummy: false,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
