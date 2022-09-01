import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';
import 'package:reasa/widgets.dart';

checkoutPaymentPanel() {
  CartViewModel cart = Get.find<CartViewModel>();
  return Column(
    children: [
      keyValuePairs("Subtotal", "Rs. ${cart.calculateCartTotal()}"),
      keyValuePairs("Delivery Fee", "Rs. ${cart.restaurant.deliveryFee}"),
      keyValuePairs("Platform Fee", "Rs. 4.99"),
    ],
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
        color: Colors.grey[600],
      ),
      poppinsText(
        value,
        weight: bold ? FontWeight.w600 : FontWeight.w400,
        size: 15,
        color: Colors.grey[600],
      ),
    ],
  );
}
