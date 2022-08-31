import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';
import 'package:reasa/widgets.dart';

paymentPanel() {
  CartViewModel cart = Get.find<CartViewModel>();
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        keyValuePairs(
          "Subtotal",
          "Rs. ${cart.calculateTotal()}",
          bold: true,
        ),
        keyValuePairs(
          "Delivery Fee",
          "Rs. ${cart.restaurant.deliveryFee}",
        ),
        keyValuePairs(
          "Platform Fee",
          "Rs. 4.99",
        ),
      ],
    ),
  );
}

keyValuePairs(key, value, {bold = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      poppinsText(
        key,
        weight: bold ? FontWeight.w600 : FontWeight.w400,
        size: 15,
      ),
      poppinsText(
        value,
        weight: bold ? FontWeight.w600 : FontWeight.w400,
        size: 15,
      ),
    ],
  );
}
