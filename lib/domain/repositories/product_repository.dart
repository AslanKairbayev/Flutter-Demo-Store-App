import 'package:demo_app/domain/entities/Product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(String productId);
}
