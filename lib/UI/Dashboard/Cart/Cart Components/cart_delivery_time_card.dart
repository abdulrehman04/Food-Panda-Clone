import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/widgets.dart';

cartDeliveryCard() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Image.asset(
            "assets/foodpan2.png",
            height: 45.h,
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                poppinsText(
                  "Estimated delivery",
                  color: Colors.grey,
                ),
                poppinsText(
                  "45 min",
                  color: Colors.black,
                  weight: FontWeight.w500,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
