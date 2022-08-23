import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../View Models/Auth View Model/auth_view_model.dart';
import '../../../constants.dart';
import '../../../widgets.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key}) : super(key: key);

  final AuthViewModel auth = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
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
                decoration: BoxDecoration(
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
      ),
    );
  }
}
