import 'dart:collection';
import 'package:demo_app/presentation/models/cart_model.dart';

abstract class CartService {
  UnmodifiableMapView<String, CartModel> get cartItems;
  int get cartItemsCount;
  double get totalAmount;
  void addItem({productId, price, title, imgUrl});
  void updateItemsAddOne(String productId);
  void updateItemsSubOne(String productId);
  void deleteItem(String productId);
  void clear();
}
