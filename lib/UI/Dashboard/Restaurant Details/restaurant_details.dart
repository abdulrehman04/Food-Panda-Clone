import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Restaurant%20Details/Restaurant%20Details%20Components/category_item_ui.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/dummy_data.dart';
import 'package:reasa/widgets.dart';

import 'Restaurant Details Components/top_image_clip_rect.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({Key? key}) : super(key: key);

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  // int currentIndex = 0;
  // bool pauseAnimate = false;

  List items = [
    "Test 1",
    "Test 2",
    "Test 3",
    "Test 4",
    "Test 5",
    "Test 6",
    "Test 7",
    "Test 8",
    "Test 9",
    "Test 10",
    "Test 11",
    "Test 12",
    "Test 13",
    "Test 14",
    "Test 15",
    "Test 16",
    "Test 17",
    "Test 18",
    "Test 19",
    "Test 20",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: dummyRestaurantDetails.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: Get.height / 2 - 100.h,
              floating: true,
              stretch: true,
              pinned: true,
              bottom: TabBar(
                  controller: tabController,
                  indicatorColor: kclrPrimaryColor,
                  indicatorWeight: 3.0,
                  isScrollable: true,
                  tabs: dummyRestaurantDetails.map<Widget>((e) {
                    return Container(
                      child: poppinsText(
                        e.categoryName,
                        size: 14.sp,
                        weight: FontWeight.w600,
                      ),
                    );
                  }).toList()),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150.h,
                      child: ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/Deals/deal1.jpeg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          poppinsText(
                            "Restaurant 1",
                            color: Colors.black,
                            weight: FontWeight.w600,
                            size: 18.sp,
                            align: TextAlign.start,
                          ),
                          Row(
                            children: [
                              poppinsText(
                                "3.3km away",
                                color: Colors.grey[700],
                                size: 12.sp,
                                weight: FontWeight.w300,
                              ),
                              poppinsText(
                                " |   ",
                                color: Colors.grey[700],
                                size: 12.sp,
                                weight: FontWeight.w300,
                              ),
                              ...([1, 2, 3, 4, 5].map((e) {
                                return const Icon(
                                  Icons.star,
                                  color: kclrPrimaryColor,
                                  size: 13,
                                );
                              }).toList()),
                              poppinsText(
                                " 1000+ ratings",
                                color: Colors.grey[700],
                                size: 12.sp,
                                weight: FontWeight.w300,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_sharp,
                                color: kclrPrimaryColor,
                              ),
                              poppinsText(
                                "  Delivery: 45 min",
                                color: Colors.black,
                                weight: FontWeight.w600,
                                size: 13.sp,
                                align: TextAlign.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: SizedBox(
          height: 700,
          child: ListView.builder(
            itemCount: dummyRestaurantDetails.length,
            itemBuilder: (context, index) {
              if (!context.debugDoingBuild) {
                tabController.animateTo(
                  (index),
                  duration: const Duration(seconds: 0),
                );
              }
              return categoryItemUI(dummyRestaurantDetails[index]);
            },
          ),
        ),
      ),
    );
  }
}
