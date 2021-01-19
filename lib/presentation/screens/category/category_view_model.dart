import 'dart:collection';
import 'package:demo_app/core/usecases/usecase.dart';
import 'package:demo_app/domain/usecases/getProducts.dart';
import 'package:demo_app/presentation/enums/screen_state.dart';
import 'package:demo_app/presentation/models/product_model.dart';
import 'package:demo_app/presentation/screens/base_view_model.dart';

class CategoryViewModel extends BaseViewModel {
  final GetProducts _getProducts;

  CategoryViewModel(GetProducts getProducts) : _getProducts = getProducts;

  List<ProductModel> _productsProvider;

  UnmodifiableListView<ProductModel> get getProducts =>
      UnmodifiableListView(_productsProvider);

  Future<void> loadProductsByCategory(String category) async {
    setState(ScreenState.Busy);

    await Future.delayed(Duration(seconds: 0), () async {
      final result = await _getProducts.call(NoParams());
      _productsProvider = result
          .where((element) => element.category == category)
          .map((e) => ProductModel(
                id: e.id,
                title: e.title,
                description: e.description,
                price: e.price,
                color: e.color,
                imgUrl: e.imgUrl,
              ))
          .toList();
    });

    setState(ScreenState.Idle);
  }
}
