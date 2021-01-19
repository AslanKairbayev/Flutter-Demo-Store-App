import 'dart:collection';
import 'package:demo_app/presentation/enums/screen_state.dart';
import 'package:demo_app/presentation/models/cart_model.dart';
import 'package:demo_app/presentation/services/cart_service.dart';
import 'package:demo_app/presentation/screens/base_view_model.dart';

class CartViewModel extends BaseViewModel {
  final CartService _cartService;

  CartViewModel(CartService cartService) : _cartService = cartService;

  UnmodifiableMapView<String, CartModel> get getCartItems =>
      _cartService.cartItems;

  int get cartItemsCount => _cartService.cartItemsCount;

  double get totalAmount => _cartService.totalAmount;

  void addItem({productId, price, title, imgUrl}) {
    setState(ScreenState.Busy);
    _cartService.addItem(
      productId: productId,
      price: price,
      title: title,
      imgUrl: imgUrl,
    );
    setState(ScreenState.Idle);
  }

  void updateItemsAddOne(String productId) {
    setState(ScreenState.Busy);
    _cartService.updateItemsAddOne(productId);
    setState(ScreenState.Idle);
  }

  void updateItemsSubOne(String productId) {
    setState(ScreenState.Busy);
    _cartService.updateItemsSubOne(productId);
  }

  void deleteItem(String productId) {
    setState(ScreenState.Busy);
    _cartService.deleteItem(productId);
  }

  void clear() {
    setState(ScreenState.Busy);
    _cartService.clear();
    setState(ScreenState.Idle);
  }
}
