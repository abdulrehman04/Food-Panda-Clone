import 'package:get/state_manager.dart';
import 'package:reasa/Model/category_item_model.dart';

class CartItemModel {
  CategoryItemModel foodItem;
  RxInt quantity;

  CartItemModel({required this.foodItem, required this.quantity});
}
