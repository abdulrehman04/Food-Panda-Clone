import 'package:get/state_manager.dart';
import 'package:reasa/Model/cart_item_model.dart';
import 'package:reasa/constants.dart';

class CheckoutViewModel extends GetxController {
  RxBool isSubmitting = RxBool(false);

  updateIsSubmitting() {
    isSubmitting.value = !isSubmitting.value;
  }

  Future<bool> placeOrder(restaurant, total, List<CartItemModel> items) async {
    var ref = await db.collection("Orders").add({
      'from': auth.currentUser!.uid,
      'restaurant': restaurant,
      'total': total,
      'items': items.map((e) {
        return {
          'name': e.foodItem.name.value,
          'category': e.foodItem.category.value,
          'quantity': e.quantity.value,
        };
      }).toList(),
    });
    if (ref.id != null) {
      return true;
    } else {
      return false;
    }
  }
}
