import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_card_top.dart';
import 'package:reasa/widgets.dart';

checkoutPaymentMethod() {
  return Card(
    margin: const EdgeInsets.all(0),
    child: Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 10,
          ),
          child: checkoutCardTop(
            Icons.account_balance_wallet_outlined,
            "Payment method",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.money,
                    color: Colors.grey,
                    size: 22.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  poppinsText(
                    "Cash",
                    align: TextAlign.start,
                    weight: FontWeight.bold,
                    size: 12,
                  ),
                ],
              ),
              poppinsText(
                "Rs. 652.99",
                weight: FontWeight.w600,
                size: 13,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    ),
  );
}
