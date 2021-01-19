import 'package:demo_app/domain/entities/Product.dart';
import 'package:flutter/widgets.dart';

class ProductModel extends Product with ChangeNotifier {
  ProductModel({
    @required String id,
    @required String title,
    @required String description,
    @required num price,
    @required String imgUrl,
    color,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          imgUrl: imgUrl,
          color: color,
        );
}
