import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Home%20Components/logged_in_drawer.dart';
import 'package:reasa/UI/Dashboard/Home%20Components/not_logged_in_drawer.dart';

import '../../../View Models/Auth View Model/auth_view_model.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key}) : super(key: key);

  final AuthViewModel auth = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: auth.loggedIn ? loggedInDrawer(auth) : notLoggedInDrawer(auth),
    );
  }
}
