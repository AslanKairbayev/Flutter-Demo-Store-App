import 'package:demo_app/core/usecases/usecase.dart';
import 'package:demo_app/domain/entities/Product.dart';
import 'package:demo_app/domain/repositories/product_repository.dart';

class GetProductById extends UseCase<Product, Params> {
  final ProductRepository productRepository;

  GetProductById(this.productRepository);

  @override
  Future<Product> call(Params params) async {
    return await productRepository.getProductById(params.productId);
  }
}

class Params {
  final String productId;

  Params({this.productId});
}
