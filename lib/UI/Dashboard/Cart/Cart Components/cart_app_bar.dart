import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

cartAppBar() {
  return PreferredSize(
    preferredSize: Size(double.infinity, 50.h),
    child: SafeArea(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 15),
                child: Icon(
                  Icons.close,
                  color: kclrPrimaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListTile(
              title: poppinsText(
                "Cart",
                weight: FontWeight.w500,
                align: TextAlign.start,
              ),
              subtitle: poppinsText(
                "Restaurant 1",
                weight: FontWeight.w300,
                size: 12,
                align: TextAlign.start,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
