import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/home.dart';
import 'package:reasa/constants.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key) {
    Timer(const Duration(seconds: 3), () {
      Get.off(() => const Home());
    });
  }

  @override
  Widget build(BuildContext context) {
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
