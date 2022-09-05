import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Home/Home%20Components/cuisines.dart';
import 'package:reasa/UI/Dashboard/Home/Home%20Components/home_app_bar.dart';
import 'package:reasa/UI/Dashboard/Home/Home%20Components/main_menu.dart';
import '../../../View Models/Cart View Model/cart_view_model.dart';
import 'Home Components/daily_deals.dart';
import 'Home Components/drawer.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final CartViewModel cart = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: homeAppBar(),
      drawer: HomeDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 310.h,
              child: const MainMenu(),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 195.h,
              child: const DailyDeals(),
            ),
            SizedBox(
              height: 160.h,
              child: const Cuisines(),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
