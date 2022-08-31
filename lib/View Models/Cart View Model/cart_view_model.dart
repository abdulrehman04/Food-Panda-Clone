import 'package:get/get.dart';
import 'package:reasa/Model/cart_item_model.dart';
import 'package:reasa/Model/category_item_model.dart';
import 'package:reasa/Model/restaurant_model.dart';
import 'package:reasa/UI/Dashboard/Checkout/checkout_stepper.dart';

class CartViewModel extends GetxController {
  late RestaurantModel restaurant;
  RxList<CartItemModel> cartItems = RxList([]);

  // RxInt cartStage = RxInt(1);

  itemExistsInCart(CategoryItemModel item) {
    return cartItems.indexWhere((p0) => p0.foodItem.name == item.name);
  }

  calculateTotal() {
    return cartItems.fold<double>(
      0,
      (previousValue, element) =>
          previousValue +
          (element.foodItem.price.value * element.quantity.value),
    );
  }

  // updateCartStage(val) {
  //   cartStage.value = val;
  // }

  navigateToCheckout() {
    Get.to(() => CheckoutStepper());
  }
}
