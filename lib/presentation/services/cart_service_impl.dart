import 'dart:collection';
import 'package:demo_app/presentation/models/cart_model.dart';
import 'package:demo_app/presentation/services/cart_service.dart';

class CartServiceImpl implements CartService {
  Map<String, CartModel> _cartItems = {};

  UnmodifiableMapView<String, CartModel> get cartItems =>
      UnmodifiableMapView(_cartItems);

  int get cartItemsCount => _cartItems.length;

  double get totalAmount {
    var total = 0.0;

    _cartItems.forEach((key, value) {
      total += value.price * value.number;
    });

    return total;
  }

  void addItem({productId, price, title, imgUrl}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (value) => CartModel(
              id: value.id,
              title: value.title,
              number: value.number + 1,
              price: value.price,
              imgUrl: value.imgUrl));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartModel(
              id: '${DateTime.now()}',
              title: title,
              number: 1,
              price: price,
              imgUrl: imgUrl));
    }
  }

  void deleteItem(String productId) {
    _cartItems.remove(productId);
  }

  void updateItemsAddOne(String productId) {
    _cartItems.update(
        productId,
        (value) => CartModel(
            id: value.id,
            title: value.title,
            number: value.number + 1,
            price: value.price,
            imgUrl: value.imgUrl));
  }

  void updateItemsSubOne(String productId) {
    if (_cartItems[productId].number < 2) {
      deleteItem(productId);
    } else {
      _cartItems.update(
          productId,
          (value) => CartModel(
              id: value.id,
              title: value.title,
              number: value.number - 1,
              price: value.price,
              imgUrl: value.imgUrl));
    }
  }

  void clear() {
    _cartItems = {};
  }
}
