import 'package:get/state_manager.dart';
import 'package:reasa/Model/category_item_model.dart';
import 'package:reasa/Model/restaurant_model.dart';

class CartViewModel extends GetxController {
  late RestaurantModel restaurant;
  RxList cartItems = RxList([]);

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
}
