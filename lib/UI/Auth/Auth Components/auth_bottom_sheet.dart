import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:reasa/constants.dart';

import '../../../widgets.dart';

authBottomSheet(onGoogleClick, onEmailClick) {
  return Get.bottomSheet(
    Container(
      height: 250.h,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          poppinsText(
            "Sign up or Log in",
            size: 20,
            weight: FontWeight.w600,
          ),
          SizedBox(
            height: 15.h,
          ),
          longButtonWithIcon(
            textColor: Colors.grey[600],
            title: "Continue with Google",
            icon: const Icon(
              FontAwesomeIcons.google,
            ),
            onTap: onGoogleClick,
          ),
          SizedBox(
            height: 15.h,
          ),
          longButtonWithIcon(
            textColor: Colors.white,
            color: const Color(0xff4267B2),
            title: "Continue with Facebook",
            icon: const Icon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
            ),
            onTap: null,
          ),
          SizedBox(
            height: 10.h,
          ),
          Stack(
            children: [
              const Divider(),
              Positioned(
                left: 150.w,
                right: 150.w,
                child: Container(
                  color: Colors.white,
                  child: poppinsText(
                    "OR",
                    color: Colors.black,
                    weight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          longButton(
            title: "Continue with email",
            onTap: onEmailClick,
            textColor: kclrPrimaryColor,
            borderColor: kclrPrimaryColor,
          ),
        ],
      ),
    ),
  );
}
