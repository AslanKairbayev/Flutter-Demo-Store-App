import 'package:flutter/material.dart';

class CartModel {
  final String id;
  final String title;
  final int number;
  final num price;
  final String imgUrl;

  CartModel({
    @required this.id,
    @required this.title,
    @required this.number,
    @required this.price,
    @required this.imgUrl,
  });
}
