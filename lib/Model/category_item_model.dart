class CategoryItemModel {
  String name, desc, image;
  double price;

  CategoryItemModel({
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
  });

  factory CategoryItemModel.fromJson(json) {
    return CategoryItemModel(
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
      price: json['price'],
    );
  }
}
