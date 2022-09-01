import 'package:flutter/material.dart';
import 'package:reasa/Model/category_item_model.dart';

class CategoryModel {
  String categoryName, id;
  List<CategoryItemModel> categoryItems;

  CategoryModel(
      {required this.categoryName,
      required this.id,
      required this.categoryItems});

  factory CategoryModel.fromJson(json, id) {
    return CategoryModel(
      id: id,
      categoryName: json['categoryName'],
      categoryItems: json['categoryItems'].map<CategoryItemModel>((e) {
        return CategoryItemModel.fromJson(e, json['categoryName']);
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
