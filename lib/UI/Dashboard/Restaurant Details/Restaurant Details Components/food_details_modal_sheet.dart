import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/Model/cart_item_model.dart';
import 'package:reasa/Model/category_item_model.dart';
import 'package:reasa/UI/Dashboard/Restaurant%20Details/Restaurant%20Details%20Components/top_image_clip_rect.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

import '../../../../View Models/Cart View Model/cart_view_model.dart';

foodDetailsBottomModalSheet(CategoryItemModel item) {
  CartViewModel cart = Get.find<CartViewModel>();
  int index = cart.itemExistsInCart(item);

  int quantity = 1;

  if (index != -1) {
    quantity = cart.cartItems[index].quantity.value;
  }
  return Get.bottomSheet(
    StatefulBuilder(builder: (context, sst) {
      return Container(
        height: 350.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(item.image.value),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      poppinsText(
                        item.name.value,
                        size: 16.sp,
                        weight: FontWeight.w600,
                      ),
                      poppinsText(
                        "Rs. ${item.price.value}",
                        size: 15.sp,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  poppinsText(
                    item.desc.value,
                    color: Colors.grey,
                    size: 13.sp,
                    align: TextAlign.start,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          addSubtractButton(Colors.grey, Icons.remove, () {
                            if (quantity > 0) {
                              sst(() {
                                quantity--;
                              });
                            }
                          }),
                          SizedBox(
                            width: 20.w,
                          ),
                          poppinsText(
                            "$quantity",
                            weight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          addSubtractButton(kclrPrimaryColor, Icons.add, () {
                            // if (quantity > 0) {
                            sst(() {
                              quantity++;
                            });
                            // }
                          }),
                          SizedBox(
                            width: 25.w,
                          ),
                        ],
                      ),
                      Expanded(
                        child: longButton(
                          title: "Add to cart",
                          onTap: () {
                            if (index == -1) {
                              cart.cartItems.add(
                                CartItemModel(
                                  foodItem: item,
                                  quantity: RxInt(quantity),
                                ),
                              );
                            } else {
                              cart.cartItems[index].quantity.value = quantity;
                            }
                            Get.back();
                          },
                          color: kclrPrimaryColor,
                          textColor: Colors.white,
                          borderColor: kclrPrimaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }),
  );
}

addSubtractButton(color, icon, onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 30.h,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    ),
  );
}
