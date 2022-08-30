import 'package:reasa/Model/category_item_model.dart';

class CategoryModel {
  String categoryName;
  List<CategoryItemModel> categoryItems;

  CategoryModel({required this.categoryName, required this.categoryItems});

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      categoryName: json['categoryName'],
      categoryItems: json['categoryItems'].map<CategoryItemModel>((e) {
        return CategoryItemModel.fromJson(e);
      }).toList(),
    );
  }

  static Map<String, dynamic> toJson(CategoryModel item) {
    return {
      "categoryName": item.categoryName,
      'categoryItems':
          item.categoryItems.map((e) => CategoryItemModel.toJson(e)).toList(),
    };
  }
}
