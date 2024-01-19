import 'package:e_commerce/models/category.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final String description;
  final Category category;
  final List<String> images;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      'category': category.toJson(),
    };
  }

  Product.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        description = json['description'],
        category = Category.fromJSON(json['category']),
        images = json['images'].toList().cast<String>();

  Product(
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.images,
  );
}
