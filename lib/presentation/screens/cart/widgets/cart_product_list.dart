import 'package:flutter/material.dart';

import 'cart_product.dart';

class CartProductList extends StatelessWidget {
  final model;

  CartProductList({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: model.cartItemsCount,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(model.getCartItems.keys.toList()[index]),
              background: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) =>
                  model.deleteItem(model.getCartItems.keys.toList()[index]),
              child: CartProduct(index: index),
            );
          }),
    );
  }
}
