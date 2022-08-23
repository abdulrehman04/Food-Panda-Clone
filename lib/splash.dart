import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/UI/Dashboard/home.dart';
import 'package:reasa/constants.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

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
