import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reasa/UI/Dashboard/Restaurants/Restaurant%20Components/restaurant_item.dart';
import 'package:reasa/UI/Dashboard/Search/Search%20Components/no_text_search_suggestions.dart';
import 'package:reasa/UI/Dashboard/Search/Search%20Components/text_search_field.dart';
import 'package:reasa/View%20Models/All%20Restaurants%20View%20Model/all_restaurants_view_model.dart';
import 'package:reasa/View%20Models/Search%20View%20Model/search_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

class RestaurantSearchDelegate extends SearchDelegate {
  AllRestaurantsViewModel restaurants = Get.find<AllRestaurantsViewModel>();
  SearchViewModel search = Get.put(SearchViewModel());

  @override
  String? get searchFieldLabel => "Search for restaurants";

  @override
  TextStyle? get searchFieldStyle => GoogleFonts.poppins(
        fontSize: 10.sp,
        color: Colors.amber,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      inputDecorationTheme: searchFieldDecorationTheme,
      textTheme: TextTheme(
        titleMedium: GoogleFonts.poppins(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void showResults(BuildContext context) {
    search.recentSearches!.add(query);
    search.setRecentSearches();
    super.showResults(context);
  }

  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        labelStyle: GoogleFonts.poppins(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        hintStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
        ),
        filled: true,
        constraints: const BoxConstraints(
          maxHeight: 35,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        fillColor: Colors.grey[300],
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back,
        color: kclrPrimaryColor,
        size: 22,
      ),
    );
  }

  setQuery(data) {
    query = data;
    showResults(Get.context!);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: restaurants.restaurants
              .where(
                (element) => element.name.toLowerCase().startsWith(
                      query.toLowerCase(),
                    ),
              )
              .toList()
              .map((e) {
            return InkWell(
              onTap: () {
                restaurants.navigateToRestaurant(e);
              },
              child: restaurantItem(
                e,
                fullSize: true,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return noTextSearchSiggestions(setQuery);
    } else {
      return textSearchField(query, setQuery);
    }
  }
}
