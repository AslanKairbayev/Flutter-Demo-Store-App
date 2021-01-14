import 'package:demo_app/core/usecases/usecase.dart';
import 'package:demo_app/domain/entities/Product.dart';
import 'package:demo_app/domain/repositories/product_repository.dart';

class GetProducts extends UseCase<List<Product>, NoParams> {
  final ProductRepository productRepository;

  GetProducts(this.productRepository);

  @override
  Future<List<Product>> call(NoParams params) async {
    return await productRepository.getProducts();
  }
}
