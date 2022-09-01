import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_delivery_address_card.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_order_summary.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_payment_method.dart';

checkout() {
  return Column(
    children: [
      checkoutDeliveryAddressCard(),
      SizedBox(
        height: 13.h,
      ),
      checkoutPaymentMethod(),
      SizedBox(
        height: 13.h,
      ),
      checkoutOrderSummary(),
      SizedBox(
        height: 120.h,
      ),
    ],
  );
}
