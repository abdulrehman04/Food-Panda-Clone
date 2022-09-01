import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_app_bar.dart';
import 'package:reasa/UI/Dashboard/Checkout/checkout.dart';
import 'package:reasa/UI/Dashboard/Home/home.dart';
import 'package:reasa/View%20Models/Cart%20View%20Model/cart_view_model.dart';
import 'package:reasa/View%20Models/Checkout%20View%20Model/checkout_view_model.dart';
import 'package:reasa/constants.dart';
import 'package:reasa/widgets.dart';
import '../../../View Models/Auth View Model/auth_view_model.dart';
import '../Cart/Cart Components/payments_panel.dart';

class CheckoutStepper extends StatelessWidget {
  CheckoutStepper({Key? key}) : super(key: key);

  final CartViewModel cartVm = Get.find<CartViewModel>();
  final AuthViewModel auth = Get.put(AuthViewModel());
  final CheckoutViewModel checkoutVm = Get.put(CheckoutViewModel());

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
                    "Rs. ${(cartVm.calculateCartTotal() + cartVm.restaurant.deliveryFee + 4.99).ceil()}",
                    bold: true,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() {
                    return checkoutVm.isSubmitting.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: kclrPrimaryColor,
                            ),
                          )
                        : longButton(
                            title: "Place Order",
                            onTap: () async {
                              checkoutVm.updateIsSubmitting();
                              var orderPlaced = await checkoutVm.placeOrder(
                                cartVm.restaurant.id,
                                cartVm.calculateTotalOrder(),
                                cartVm.cartItems,
                              );
                              if (orderPlaced) {
                                checkoutVm.updateIsSubmitting();
                                Get.offAll(() => Home());
                                successSnack("Order Placed Successfully");
                              } else {
                                checkoutVm.updateIsSubmitting();
                                errorSnack("Failed to place order");
                              }
                            },
                            color: kclrPrimaryColor,
                            textColor: Colors.white,
                            borderColor: kclrPrimaryColor,
                          );
                  }),
                ],
              ),
            ),
          );
  }
}
