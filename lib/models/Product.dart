import 'dart:collection';
import 'package:flutter/widgets.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imgUrl,
      @required this.color});
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Yellow happiness',
      description: 'You will get a real pleasure',
      price: 15.00,
      imgUrl: 'assets/images/1.jpg',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p1',
      title: 'Spring awakening',
      description: 'You will get a real pleasure',
      price: 77.99,
      imgUrl: 'assets/images/2.jpg',
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p2',
      title: 'Summer pleasure',
      description: 'You will get a real pleasure',
      price: 99.99,
      imgUrl: 'assets/images/3.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p4',
      title: 'Green faint',
      description: 'You will get a real pleasure',
      price: 35.99,
      imgUrl: 'assets/images/4.jpg',
      color: '0xFFCCFF90',
    )
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((element) => element.id == id);
}
