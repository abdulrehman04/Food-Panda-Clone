import 'package:get/state_manager.dart';

class CategoryItemModel {
  RxString name, desc, image;
  RxDouble price;

  CategoryItemModel({
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
  });

  factory CategoryItemModel.fromJson(json) {
    return CategoryItemModel(
      name: RxString(json['name']),
      image: RxString(json['image']),
      desc: RxString(json['desc']),
      price: RxDouble(json['price']),
    );
  }

  static Map toJson(CategoryItemModel item) {
    return {
      'name': item.name.value,
      "image": item.image.value,
      "desc": item.desc.value,
      'price': item.price.value,
    };
  }
}
