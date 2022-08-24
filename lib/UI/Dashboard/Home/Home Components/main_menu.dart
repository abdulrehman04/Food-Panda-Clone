import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Restaurants/restaurants.dart';
import 'package:reasa/widgets.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => Restaurants());
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ListTile(
                            title: poppinsText(
                              "Food Delivery",
                              weight: FontWeight.bold,
                              size: 16,
                              align: TextAlign.start,
                            ),
                            subtitle: poppinsText(
                              "Order from your favourite restaurants and home chefs.",
                              size: 11,
                              align: TextAlign.start,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "assets/burger_main.png",
                              height: 85.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: poppinsText(
                              "Dine-in",
                              weight: FontWeight.bold,
                              size: 16,
                              align: TextAlign.start,
                            ),
                            subtitle: poppinsText(
                              "Exclusive offers at part",
                              size: 13,
                              align: TextAlign.start,
                              overflow: true,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset("assets/burger_main.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          title: poppinsText(
                            "pandamart",
                            weight: FontWeight.bold,
                            size: 16,
                            align: TextAlign.start,
                          ),
                          subtitle: poppinsText(
                            "Convenience, delivered!",
                            size: 11,
                            align: TextAlign.start,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              "assets/shopping-cart.png",
                              height: 45.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: poppinsText(
                              "Shops",
                              weight: FontWeight.bold,
                              size: 16,
                              align: TextAlign.start,
                            ),
                            subtitle: poppinsText(
                              "Everyday essentials",
                              size: 13,
                              align: TextAlign.start,
                              // overflow: true,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Image.asset("assets/shop.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: poppinsText(
                              "Pick-up",
                              weight: FontWeight.bold,
                              size: 16,
                              align: TextAlign.start,
                            ),
                            subtitle: poppinsText(
                              "Enjoy upto 50% off and",
                              size: 13,
                              align: TextAlign.start,
                              overflow: true,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8, right: 8),
                              child: Image.asset(
                                "assets/pickup.png",
                                height: 35.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
