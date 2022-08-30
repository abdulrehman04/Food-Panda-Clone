import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:reasa/Model/restaurant_model.dart';
import 'package:reasa/UI/Dashboard/Restaurants/Restaurant%20Components/restaurant_item.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

class RestaurantsUnderACategory extends StatelessWidget {
  final String title;
  final List<RestaurantModel> restaurants;
  const RestaurantsUnderACategory(
      {Key? key, required this.title, required this.restaurants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            heading1(title),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: restaurants.map<Widget>((e) {
                  return restaurantItem(e, dummy: false);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
