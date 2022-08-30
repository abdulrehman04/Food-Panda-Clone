import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

cartBottom(CartViewModel cart) {
  return Container(
    height: 50.h,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: kclrPrimaryColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 23.h,
          width: 23.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          child: Center(
            child: poppinsText(
              cart.cartItems.length.toString(),
              color: Colors.white,
              weight: FontWeight.w500,
              size: 12,
            ),
          ),
        ),
        poppinsText(
          "View your cart",
          color: Colors.white,
          weight: FontWeight.w500,
        ),
        poppinsText(
          "Rs. ${cart.calculateTotal()}",
          color: Colors.white,
          weight: FontWeight.w500,
        )
      ],
    ),
  );
}
