import 'dart:collection';

import 'package:demo_app/core/usecases/usecase.dart';
import 'package:demo_app/domain/usecases/getProducts.dart';
import 'package:demo_app/presentation/models/ProductProvider.dart';
import 'package:flutter/widgets.dart';

class HomePageProvider with ChangeNotifier {
  final GetProducts _getProducts;

  HomePageProvider(GetProducts getProducts) : _getProducts = getProducts;

  UnmodifiableListView<ProductProvider> _productsProvider;

  UnmodifiableListView<ProductProvider> get getProducts => _productsProvider;

  Future<void> loadProducts() async {
    await Future.delayed(Duration(seconds: 5), () async {
      final result = await _getProducts.call(NoParams());
      final mapper = result
          .map((e) => ProductProvider(
                id: e.id,
                title: e.title,
                description: e.description,
                price: e.price,
                color: e.color,
                imgUrl: e.imgUrl,
              ))
          .toList();
      _productsProvider = UnmodifiableListView(mapper);
    });

    notifyListeners();
  }
}
