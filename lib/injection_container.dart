import 'package:demo_app/data/datasources/product_remote_data_source.dart';
import 'package:demo_app/data/repositories/product_repository_impl.dart';
import 'package:demo_app/domain/repositories/product_repository.dart';
import 'package:demo_app/domain/usecases/getProductById.dart';
import 'package:demo_app/domain/usecases/getProducts.dart';
import 'package:demo_app/presentation/providers/home_page_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // UseCases
  sl.registerFactory(() => HomePageProvider(sl()));
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => GetProductById(sl()));
  // Repos
  sl.registerLazySingleton<ProductRepository>(
      (() => ProductRepositoryImpl(sl())));
  sl.registerLazySingleton<ProductRemoteDataSource>(
      (() => FakeProductRemoteDataSourceImpl()));
}
