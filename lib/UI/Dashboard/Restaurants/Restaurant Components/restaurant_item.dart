import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

Widget restaurantItem(e, {fullSize = false, dummy = false}) {
  return SizedBox(
    width: fullSize ? double.infinity : 220.w,
    height: fullSize ? 240.h : 220.h,
    child: Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            width: fullSize ? double.infinity : 220.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: dummy
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/Restaurants/${e.image}",
                      ),
                    )
                  : DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "${e.image}",
                      ),
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: poppinsText(
                        e.name,
                        weight: FontWeight.w500,
                        size: 13.sp,
                        align: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: kclrPrimaryColor,
                            size: 10.h,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          poppinsText(
                            e.rating.toString(),
                            weight: FontWeight.w500,
                            size: 10.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          poppinsText(
                            "(${e.totalRatings})",
                            weight: FontWeight.w300,
                            color: Colors.grey[500],
                            size: 10.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: poppinsText(
                  e.foodType,
                  color: Colors.grey[500],
                  size: 13.sp,
                  align: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.delivery_dining_rounded,
                      size: 16.sp,
                      color: Colors.grey[500],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    poppinsText(
                      "Rs. ${e.deliveryFee}",
                      color: Colors.grey[500],
                      size: 12.sp,
                      align: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
