import 'package:demo_app/domain/entities/Product.dart';

class ProductData extends Product {
  ProductData({
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

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
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
