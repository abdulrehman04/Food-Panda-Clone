import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Cart/cart.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_app_bar.dart';
import 'package:reasa/UI/Dashboard/Checkout/checkout.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';
import '../../../View Models/Auth View Model/auth_view_model.dart';
import '../Cart/Cart Components/payments_panel.dart';

class CheckoutStepper extends StatelessWidget {
  CheckoutStepper({Key? key}) : super(key: key);

  final CartViewModel cartVm = Get.find<CartViewModel>();
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
            appBar: checkoutAppBar(),
            body: Column(
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      colorScheme: const ColorScheme.light(
                        primary: kclrPrimaryColor,
                      ),
                    ),
                    child: Stepper(
                      currentStep: 2,
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
                          content: poppinsText("yoh"),
                          isActive: true,
                        ),
                        Step(
                          title: poppinsText("Checkout"),
                          content: checkout(),
                          isActive: true,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomSheet: Container(
              height: 105.h,
              padding: const EdgeInsets.all(15),
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
