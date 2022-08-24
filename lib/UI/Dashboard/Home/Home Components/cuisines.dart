import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets.dart';

class Cuisines extends StatelessWidget {
  const Cuisines({Key? key}) : super(key: key);

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
              "Cuisines",
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
                  {
                    'name': "Food 1",
                    "image": 'food1.png',
                  },
                  {
                    'name': "Food 2",
                    "image": 'food3.png',
                  },
                  {
                    'name': "Food 3",
                    "image": 'food4.png',
                  },
                  {
                    'name': "Food 1",
                    "image": 'food1.png',
                  },
                  {
                    'name': "Food 2",
                    "image": 'food3.png',
                  },
                  {
                    'name': "Food 3",
                    "image": 'food4.png',
                  },
                ].map<Widget>((e) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        width: 75.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/Foods/${e['image']}"),
                          ),
                        ),
                      ),
                      poppinsText(e['name'])
                    ],
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
