import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

checkoutCardTop(icon, title, {showEdit = true}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: kclrPrimaryColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          poppinsText(
            title,
            align: TextAlign.start,
            weight: FontWeight.bold,
            size: 15,
          ),
        ],
      ),
      showEdit
          ? const Icon(
              Icons.edit_outlined,
              color: kclrPrimaryColor,
            )
          : Container()
    ],
  );
}
