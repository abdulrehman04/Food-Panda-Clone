import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Cart/Cart%20Components/cart_delivery_time_card.dart';
import 'package:reasa/UI/Dashboard/Cart/Cart%20Components/cart_items.dart';
import 'package:reasa/UI/Dashboard/Cart/Cart%20Components/payments_panel.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';

Widget cart() {
  CartViewModel cart = Get.find<CartViewModel>();

  return SingleChildScrollView(
    child: Column(
      children: [
        cartDeliveryCard(),
        SizedBox(
          height: 25.h,
        ),
        ...(cart.cartItems.map<Widget>((element) {
          RxBool editOpen = RxBool(false);
          return Obx(() {
            return cartItem(element, editOpen);
          });
        }).toList()),
        const Divider(),
        paymentPanel(),
      ],
    ),
  );
}
