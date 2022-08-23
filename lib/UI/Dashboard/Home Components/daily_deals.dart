import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets.dart';

class DailyDeals extends StatelessWidget {
  const DailyDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            poppinsText(
              "Your daily picks",
              size: 15.sp,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  'deal1.jpeg',
                  'deal2.png',
                  'deal3.jpeg',
                  'deal1.jpeg',
                  'deal2.png',
                  'deal3.jpeg',
                ].map<Widget>((e) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    width: 115.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/Deals/$e"),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
