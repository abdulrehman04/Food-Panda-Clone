import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

loggedInDrawer(auth) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        child: DrawerHeader(
          decoration: const BoxDecoration(
            color: kclrPrimaryColor,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                poppinsText(
                  auth.fullName,
                  color: Colors.white,
                  weight: FontWeight.w600,
                  align: TextAlign.start,
                ),
                poppinsText(
                  auth.currentUser.email,
                  color: Colors.white,
                  weight: FontWeight.w400,
                  align: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
      ListTile(
        title: poppinsText(
          "Logout",
          color: Colors.grey[700],
          weight: FontWeight.w400,
          align: TextAlign.start,
          size: 15,
        ),
        onTap: () {
          Get.back();
          auth.logout();
        },
        trailing: const Icon(Icons.chevron_right),
      )
    ],
  );
}
