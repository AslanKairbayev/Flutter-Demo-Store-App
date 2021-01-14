import 'package:demo_app/domain/entities/Product.dart';

class ProductModel extends Product {
  ProductModel({
    String id,
    String title,
    String description,
    num price,
    String imgUrl,
    color,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          imgUrl: imgUrl,
          color: color,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        imgUrl: json['imgUrl'],
        color: json['color']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imgUrl': imgUrl,
      'color': color,
    };
  }
}
