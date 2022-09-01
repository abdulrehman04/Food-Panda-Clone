import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reasa/Services/LocationService/location_service.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

import '../../Cart/cart_stepper.dart';

restaurantAppBar() {
  LocationService location = Get.find<LocationService>();
  return AppBar(
    elevation: 3,
    iconTheme: const IconThemeData(
      color: kclrPrimaryColor,
    ),
    backgroundColor: Colors.white,
    title: poppinsText(
      location.currentAddress,
      size: 15.sp,
      weight: FontWeight.bold,
    ),
    bottom: PreferredSize(
      preferredSize: Size(double.infinity, 55.h),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(55),
        ),
        child: TextField(
          decoration: InputDecoration(
            isDense: false,
            prefixIcon: const Icon(
              Icons.search,
              color: kclrPrimaryColor,
            ),
            border: InputBorder.none,
            hintText: "Search for restaurants",
            hintStyle: GoogleFonts.poppins(),
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
          child: Icon(
            Icons.shopping_cart_outlined,
            color: kclrPrimaryColor,
          ),
        ),
      )
    ],
  );
}
