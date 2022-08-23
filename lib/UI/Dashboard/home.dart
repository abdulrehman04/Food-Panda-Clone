import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reasa/UI/Dashboard/Home%20Components/daily_deals.dart';
import 'package:reasa/UI/Dashboard/Home%20Components/drawer.dart';
import 'package:reasa/UI/Dashboard/Home%20Components/home_app_bar.dart';
import 'package:reasa/UI/Dashboard/Home%20Components/main_menu.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

import 'Home Components/cuisines.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
