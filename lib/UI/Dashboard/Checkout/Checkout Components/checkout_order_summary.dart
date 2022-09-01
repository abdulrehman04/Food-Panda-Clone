import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_card_top.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_payment_panel.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';
import 'package:reasa/widgets.dart';

checkoutOrderSummary() {
  CartViewModel cart = Get.find<CartViewModel>();

  return Card(
    margin: const EdgeInsets.all(0),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          checkoutCardTop(
            Icons.assignment,
            "Order Summary",
            showEdit: false,
          ),
          SizedBox(
            height: 15.h,
          ),
          ...(cart.cartItems.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  poppinsText(
                    "${e.quantity}x ${e.foodItem.name}",
                    size: 13,
                  ),
                  poppinsText(
                    "Rs. ${e.foodItem.price * e.quantity.value}",
                    size: 13,
                  ),
                ],
              ),
            );
          }).toList()),
          SizedBox(
            height: 5.h,
          ),
          const Divider(),
          SizedBox(
            height: 5.h,
          ),
          checkoutPaymentPanel(),
        ],
      ),
    ),
  );
}
