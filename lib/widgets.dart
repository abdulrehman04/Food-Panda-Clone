import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reasa/constants.dart';

successSnack(msg, {title = "Success"}) {
  return Get.snackbar(
    title,
    msg,
    backgroundColor: Colors.lightGreen.withOpacity(0.4),
  );
}

errorSnack(msg, {title = "Error"}) {
  return Get.snackbar(
    title,
    msg,
    backgroundColor: Colors.redAccent.withOpacity(0.4),
  );
}

textFieldWithTitle(
  label,
  controller, {
  type = TextInputType.text,
  Color borderColor = kclrPrimaryColor,
}) {
  return TextField(
    decoration: InputDecoration(
      isDense: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kclrPrimaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kclrPrimaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kclrPrimaryColor,
        ),
      ),
      labelText: label,
      labelStyle: GoogleFonts.poppins(
        color: kclrPrimaryColor,
      ),
    ),
    keyboardType: type,
  );
}

Widget poppinsText(data,
    {double size = 14,
    color = Colors.black,
    weight = FontWeight.w400,
    align = TextAlign.center,
    overflow = false}) {
  return Text(
    data,
    overflow: overflow ? TextOverflow.ellipsis : null,
    style: GoogleFonts.poppins(
      fontSize: size.sp,
      fontWeight: weight,
      color: color,
    ),
    textAlign: align,
  );
}

Widget longButtonWithIcon({
  required title,
  required icon,
  required onTap,
  color = Colors.white,
  textColor = Colors.black,
}) {
  return InkWell(
    onTap: onTap,
    child: Stack(
      children: [
        Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
            boxShadow: [boxShad(0, 1, 3)],
          ),
          child: Center(
            child: poppinsText(
              title,
              size: 14.sp,
              color: textColor,
              weight: FontWeight.w400,
            ),
          ),
        ),
        Positioned(
          left: 25,
          bottom: 8,
          top: 8,
          child: icon,
        )
      ],
    ),
  );
}

Widget longButton({
  required title,
  required onTap,
  color = Colors.white,
  textColor = Colors.black,
  borderColor = Colors.black,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        boxShadow: [boxShad(0, 1, 3)],
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Center(
        child: poppinsText(
          title,
          size: 14.sp,
          color: textColor,
          weight: FontWeight.w400,
        ),
      ),
    ),
  );
}

boxShad(double x, double y, double b) {
  return BoxShadow(
    offset: Offset(x, y),
    blurRadius: b,
    color: const Color(0xdd000000).withOpacity(0.3),
  );
}
