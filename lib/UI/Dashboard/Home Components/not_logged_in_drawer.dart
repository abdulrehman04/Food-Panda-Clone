import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../widgets.dart';

notLoggedInDrawer(auth) {
  // "Log in / Create account"

  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Get.back();
            auth.showBottomModel(() {
              auth.googleLogin();
            }, () {
              auth.pushToEmail();
            });
          },
          child: DrawerHeader(
            decoration: const BoxDecoration(
              color: kclrPrimaryColor,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: poppinsText(
                "Log in / Create account",
                color: Colors.white,
                weight: FontWeight.w600,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
