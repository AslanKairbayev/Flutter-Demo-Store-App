import 'package:demo_app/data/datasources/product_remote_data_source.dart';
import 'package:demo_app/data/repositories/product_repository_impl.dart';
import 'package:demo_app/domain/repositories/product_repository.dart';
import 'package:demo_app/domain/usecases/getProductById.dart';
import 'package:demo_app/domain/usecases/getProducts.dart';
import 'package:demo_app/presentation/screens/category/category_view_model.dart';
import 'package:demo_app/presentation/screens/home/home_view_model.dart';
import 'package:demo_app/presentation/services/cart_service.dart';
import 'package:demo_app/presentation/services/cart_service_impl.dart';
import 'package:demo_app/presentation/screens/cart/cart_view_model.dart';
import 'package:demo_app/presentation/screens/product_detail/product_detail_view_model.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // UseCases
  serviceLocator.registerLazySingleton(() => GetProducts(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetProductById(serviceLocator()));
  // Repos
  serviceLocator.registerLazySingleton<ProductRepository>(
      (() => ProductRepositoryImpl(serviceLocator())));
  serviceLocator.registerLazySingleton<ProductRemoteDataSource>(
      (() => FakeProductRemoteDataSourceImpl()));
  // Services
  serviceLocator.registerLazySingleton<CartService>((() => CartServiceImpl()));
  // Providers
  serviceLocator
      .registerFactory<HomeViewModel>(() => HomeViewModel(serviceLocator()));
  serviceLocator.registerFactory<ProductDetailViewModel>(
      () => ProductDetailViewModel(serviceLocator()));
  serviceLocator
      .registerFactory<CartViewModel>(() => CartViewModel(serviceLocator()));
  serviceLocator.registerFactory<CategoryViewModel>(
      () => CategoryViewModel(serviceLocator()));
}
