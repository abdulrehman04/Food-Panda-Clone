import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/Model/category_model.dart';
import 'package:reasa/UI/Dashboard/Restaurant%20Details/Restaurant%20Details%20Components/food_item_ui.dart';
import 'package:reasa/widgets.dart';

categoryItemUI(CategoryModel item) {
  return Container(
    color: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        poppinsText(
          item.categoryName,
          weight: FontWeight.w600,
          size: 19.sp,
        ),
        if (item.categoryItems.length == 1)
          foodItemUI(item.categoryItems[0])
        else
          ...(item.categoryItems.map((e) {
            return Column(
              children: [
                foodItemUI(e),
                item.categoryItems.last == e ? Container() : const Divider(),
              ],
            );
          }).toList())
      ],
    ),
  );
}
