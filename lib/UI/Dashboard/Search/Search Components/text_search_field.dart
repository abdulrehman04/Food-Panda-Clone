import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reasa/View%20Models/All%20Restaurants%20View%20Model/all_restaurants_view_model.dart';
import 'package:reasa/widgets.dart';

textSearchField(String query, Function setQuery) {
  AllRestaurantsViewModel restaurants = Get.find<AllRestaurantsViewModel>();

  return Column(
    children: restaurants.restaurants
        .where(
          (element) {
            return element.name.toLowerCase().startsWith(query.toLowerCase());
          },
        )
        .toList()
        .map((e) {
          return ListTile(
            onTap: () {
              setQuery(e.name);
            },
            leading: const Icon(Icons.search),
            title: poppinsText(
              e.name,
              align: TextAlign.start,
            ),
            trailing: const Icon(Icons.double_arrow_sharp),
          );
        })
        .toList(),
  );
}
