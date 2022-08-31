import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Cart/cart.dart';
import 'package:reasa/UI/Dashboard/Checkout/checkout.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';
import '../../../View Models/Auth View Model/auth_view_model.dart';
import 'Cart Components/cart_app_bar.dart';
import 'Cart Components/payments_panel.dart';

class CartStepper extends StatelessWidget {
  CartStepper({Key? key}) : super(key: key);

  CartViewModel cartVm = Get.find<CartViewModel>();
  final AuthViewModel auth = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return cartVm.cartItems.isEmpty
        ? Scaffold(
            body: Center(
              child: poppinsText("Nothing here"),
            ),
          )
        : Scaffold(
            appBar: cartAppBar(),
            body: Column(
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      colorScheme: const ColorScheme.light(
                        primary: kclrPrimaryColor,
                      ),
                    ),
                    child: Obx(() {
                      return Stepper(
                        // onStepTapped: (value) {
                        //   cartVm.updateCartStage(value);
                        // },
                        currentStep: 1,
                        controlsBuilder: ((context, details) {
                          return Container();
                        }),
                        type: StepperType.horizontal,
                        steps: [
                          Step(
                            title: poppinsText("Menu"),
                            content: poppinsText("yoh"),
                            isActive: true,
                          ),
                          Step(
                            title: poppinsText("Cart"),
                            content: cart(),
                            isActive: true,
                          ),
                          Step(
                            title: poppinsText("Checkout"),
                            content: checkout(),
                            isActive: false,
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
            bottomSheet: Container(
              padding: EdgeInsets.all(15),
              height: 105.h,
              child: Column(
                children: [
                  keyValuePairs(
                    "Total",
                    "Rs. ${(cartVm.calculateTotal() + cartVm.restaurant.deliveryFee + 4.99).ceil()}",
                    bold: true,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  longButton(
                    title: "Confirm payment and address",
                    onTap: () {
                      if (!auth.loggedIn) {
                        auth.showBottomModel(() {
                          auth.googleLogin();
                        }, () {
                          auth.pushToEmail();
                        });
                      } else {
                        cartVm.navigateToCheckout();
                      }
                    },
                    color: kclrPrimaryColor,
                    textColor: Colors.white,
                    borderColor: kclrPrimaryColor,
                  )
                ],
              ),
            ),
          );
  }
}
