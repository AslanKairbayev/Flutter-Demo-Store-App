import 'package:demo_app/domain/entities/Product.dart';
import 'package:demo_app/domain/usecases/getProductById.dart';
import 'package:flutter/widgets.dart';

class ProductPageProvider with ChangeNotifier {
  final GetProductById _getProductById;

  ProductPageProvider(GetProductById getProductById)
      : _getProductById = getProductById;

  Future<Product> getProductById(String productId) async {
    return await _getProductById.call(Params(productId: productId));
  }
}
