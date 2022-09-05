import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reasa/Services/LocationService/location_service.dart';
import 'package:reasa/UI/Dashboard/Cart/cart_stepper.dart';
import 'package:reasa/UI/Dashboard/Search/restaurant_search_delegate.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

homeAppBar() {
  LocationService location = Get.find<LocationService>();
  location = Get.find<LocationService>();
  return AppBar(
    elevation: 3,
    backgroundColor: kclrPrimaryColor,
    title: poppinsText(
      location.currentAddress,
      size: 15.sp,
      weight: FontWeight.bold,
      color: Colors.white,
    ),
    bottom: PreferredSize(
      preferredSize: Size(double.infinity, 55.h),
      child: InkWell(
        onTap: () {
          showSearch(
            context: Get.context!,
            delegate: RestaurantSearchDelegate(),
          );
          // Get.to(() => const Search());
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(55),
          ),
          child: TextField(
            decoration: InputDecoration(
              enabled: false,
              prefixIcon: const Icon(Icons.search),
              border: InputBorder.none,
              hintText: "Search for restaurants",
              hintStyle: GoogleFonts.poppins(),
            ),
          ),
        ),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          Get.to(
            () => CartStepper(),
            fullscreenDialog: true,
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.shopping_cart_outlined),
        ),
      )
    ],
  );
}
