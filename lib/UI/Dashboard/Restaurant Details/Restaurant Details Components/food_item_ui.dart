import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/Model/category_item_model.dart';
import 'package:reasa/widgets.dart';

Widget foodItemUI(CategoryItemModel item) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              poppinsText(
                item.name.value,
                align: TextAlign.start,
                weight: FontWeight.w500,
              ),
              poppinsText(
                item.desc.value,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10.h,
              ),
              poppinsText(
                "Rs. ${item.price.value.toString()}",
                size: 12,
                // color: Colors.grey,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 65.h,
            // width: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(item.image.value),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
