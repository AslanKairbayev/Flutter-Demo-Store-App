import 'package:demo_app/data/datasources/product_remote_data_source.dart';
import 'package:demo_app/domain/entities/Product.dart';
import 'package:demo_app/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl(this.productRemoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    return productRemoteDataSource.getProducts();
  }

  @override
  Future<Product> getProductById(String productId) async {
    return productRemoteDataSource.getProductById(productId);
  }
}
