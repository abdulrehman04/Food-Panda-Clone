import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Restaurant%20Details/Restaurant%20Details%20Components/cart_bottom.dart';
import 'package:reasa/UI/Dashboard/Restaurant%20Details/Restaurant%20Details%20Components/category_item_ui.dart';
import 'package:reasa/View%20Models/Restaurant%20Details%20View%20Model/restaurant_details_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

import '../../../View Models/Cart View Model/cart_view_model.dart';
import 'Restaurant Details Components/top_image_clip_rect.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({Key? key}) : super(key: key);

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  RestaurantDetailsViewModel restaurantDetails =
      Get.find<RestaurantDetailsViewModel>();

  CartViewModel cart = Get.find<CartViewModel>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: restaurantDetails.currentRestaurant.categories.length,
      vsync: this,
    );
    // cart.restaurant =
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Obx(() {
        return cart.cartItems.isEmpty
            ? Container(
                height: 0,
              )
            : cartBottom(cart);
      }),
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
                tabs: restaurantDetails.currentRestaurant.categories
                    .map<Widget>((e) {
                  return Container(
                    child: poppinsText(
                      e.categoryName,
                      size: 14.sp,
                      weight: FontWeight.w600,
                    ),
                  );
                }).toList(),
              ),
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                restaurantDetails.currentRestaurant.image,
                              ),
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
            itemCount: restaurantDetails.currentRestaurant.categories.length,
            itemBuilder: (context, index) {
              if (!context.debugDoingBuild) {
                tabController.animateTo(
                  (index),
                  duration: const Duration(seconds: 0),
                );
              }
              return categoryItemUI(
                restaurantDetails.currentRestaurant.categories[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
