import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/Services/LocationService/location_service.dart';
import 'package:reasa/UI/Dashboard/Home/home.dart';
import 'package:reasa/View%20Models/Splash%20View%20Model/splash_view_model.dart';
import 'package:reasa/constants.dart';

class Splash extends StatelessWidget {
  final LocationService location = Get.put(LocationService());
  final SplashViewModel splash = Get.put(SplashViewModel());

  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: location.initLocationService(),
        builder: ((context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            Future.delayed(const Duration(seconds: 1)).then((_) {
              splash.callToGetRestaurants();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            });
            return Container(
              color: kclrPrimaryColor,
              child: Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 125.h,
                  // width: 35.w,
                ),
              ),
            );
          }
          return Container(
            color: kclrPrimaryColor,
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                height: 125.h,
                // width: 35.w,
              ),
            ),
          );
        }),
      ),
    );
  }
}
