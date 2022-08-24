import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/home.dart';
import 'package:reasa/View%20Models/Location%20View%20Model/location_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

class Splash extends StatelessWidget {
  final LocationViewModel location = Get.put(LocationViewModel());
  Splash({Key? key}) : super(key: key) {
    location.enableLocation().then((value) {
      if (value) {
        location.getPermission().then((value) {
          if (value) {
            location.startCurrentLocationStream();
          }
        }).onError((error, stackTrace) {
          errorSnack(error);
        });
      }
    }).onError((error, stackTrace) {
      errorSnack(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    });

    return Scaffold(
      body: Container(
        color: kclrPrimaryColor,
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            height: 125.h,
            // width: 35.w,
          ),
        ),
      ),
    );
  }
}
