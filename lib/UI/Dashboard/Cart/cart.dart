import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';

import 'Cart Components/cart_app_bar.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppBar(),
      body: Column(
        children: [
          Container(
            height: 150,
            child: Stepper(
              type: StepperType.horizontal,
              steps: [
                Step(
                    title: poppinsText("Menu"),
                    content: poppinsText("yoh"),
                    isActive: true),
                Step(
                    title: poppinsText("Menu"),
                    content: poppinsText("noh"),
                    isActive: true),
                Step(title: poppinsText("Menu"), content: poppinsText("foh"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
