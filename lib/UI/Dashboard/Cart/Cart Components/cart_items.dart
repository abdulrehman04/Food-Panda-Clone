import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/Model/cart_item_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';
import '../../../../View Models/Cart View Model/cart_view_model.dart';

cartItem(CartItemModel element, editOpen) {
  CartViewModel cart = Get.find<CartViewModel>();
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Stack(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                editOpen.value = !editOpen.value;
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    poppinsText(element.quantity.value.toString()),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: kclrPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5.h,
            ),
            Expanded(
              child: Image.asset(
                element.foodItem.image.value,
                height: 35.h,
              ),
            ),
            Expanded(
              flex: 2,
              child: poppinsText(
                element.foodItem.name.value,
                color: kclrPrimaryColor,
                align: TextAlign.start,
              ),
            ),
            Expanded(
              child: poppinsText(
                "Rs ${element.quantity.value * element.foodItem.price.value}",
                size: 13.sp,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              if (editOpen.value) {
                editOpen.value = false;
              }
            },
            child: Container(
              width: Get.width - 120.w,
              height: 45.h,
              color: editOpen.value ? Colors.white70 : Colors.transparent,
            ),
          ),
        ),
        editOpen.value
            ? Container(
                width: 100.h,
                height: 45.h,
                margin: const EdgeInsets.only(left: 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    boxShad(0, 0, 4),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: InkWell(
                          onTap: () {
                            if (cart.cartItems[cart.cartItems.indexOf(element)]
                                    .quantity.value >
                                0) {
                              cart.cartItems[cart.cartItems.indexOf(element)]
                                  .quantity.value = cart
                                      .cartItems[
                                          cart.cartItems.indexOf(element)]
                                      .quantity
                                      .value -
                                  1;
                            }
                          },
                          child: const Icon(
                            Icons.remove,
                            color: kclrPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cart.cartItems[cart.cartItems.indexOf(element)]
                              .quantity.value = cart
                                  .cartItems[cart.cartItems.indexOf(element)]
                                  .quantity
                                  .value +
                              1;
                        },
                        child: const Icon(
                          Icons.add,
                          color: kclrPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container()
      ],
    ),
  );
}
