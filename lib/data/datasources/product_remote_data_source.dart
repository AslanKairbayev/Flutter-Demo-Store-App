import 'package:demo_app/domain/entities/Product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(String productId);
}

class FakeProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Yellow happiness',
      description: 'You will get a real pleasure',
      price: 15.00,
      imgUrl: 'assets/images/1.jpg',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p1',
      title: 'Spring awakening',
      description: 'You will get a real pleasure',
      price: 77.99,
      imgUrl: 'assets/images/2.jpg',
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p2',
      title: 'Summer pleasure',
      description: 'You will get a real pleasure',
      price: 99.99,
      imgUrl: 'assets/images/3.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p4',
      title: 'Green faint',
      description: 'You will get a real pleasure',
      price: 35.99,
      imgUrl: 'assets/images/4.jpg',
      color: '0xFFCCFF90',
    )
  ];

  @override
  Future<List<Product>> getProducts() async {
    return _items;
  }

  @override
  Future<Product> getProductById(String productId) async {
    return _items.singleWhere((product) => product.id == productId);
  }
}
