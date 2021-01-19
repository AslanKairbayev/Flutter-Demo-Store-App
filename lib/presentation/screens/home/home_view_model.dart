import 'dart:collection';
import 'package:demo_app/core/usecases/usecase.dart';
import 'package:demo_app/domain/usecases/getProducts.dart';
import 'package:demo_app/presentation/enums/screen_state.dart';
import 'package:demo_app/presentation/models/product_model.dart';
import 'package:demo_app/presentation/screens/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final GetProducts _getProducts;

  HomeViewModel(GetProducts getProducts) : _getProducts = getProducts;

  UnmodifiableListView<ProductModel> _productsProvider;

  List<String> _categoires = ['asd', 'xzc'];

  UnmodifiableListView<ProductModel> get getProducts => _productsProvider;

  UnmodifiableListView<String> get getCategories {
    // _productsProvider.forEach((element) {
    //   // if (_categoires.contains(element.category))
    //   _categoires.add('${element.category}');
    // });
    return UnmodifiableListView(_categoires);
  }

  Future<void> loadProducts() async {
    setState(ScreenState.Busy);

    await Future.delayed(Duration(seconds: 2), () async {
      final result = await _getProducts.call(NoParams());
      final mapper = result
          .map((e) => ProductModel(
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

    setState(ScreenState.Idle);
  }
}
