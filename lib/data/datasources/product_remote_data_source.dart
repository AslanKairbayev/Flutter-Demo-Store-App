import 'package:demo_app/domain/entities/Product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(String productId);
}

class FakeProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  List<Product> _items = [
    Product(
      id: 'p4',
      title: 'Corner Flags',
      description: 'Give your playing field а professional touch',
      price: 34.95,
      category: 'Soccer',
      imgUrl: 'assets/images/cornerflags.jpg',
      color: '0xFFCCFF90',
    ),
    Product(
      id: 'p7',
      title: 'Unsteady Chair',
      description: 'Secretly give your opponent а disadvantage',
      price: 29.95,
      category: 'Chess',
      imgUrl: 'assets/images/unsteadychair.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p8',
      title: 'Human Chess Board',
      description: 'А fun game for the family',
      price: 75,
      category: 'Chess',
      imgUrl: 'assets/images/humanchessboard.jpg',
      color: '0xFFCCFF90',
    ),
    Product(
      id: 'p5',
      title: 'Stadium',
      description: 'Flat-packed 35, 000-seat stadium',
      price: 79500,
      category: 'Soccer',
      imgUrl: 'assets/images/staduim.jpg',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p6',
      title: 'Thinking Сар',
      description: 'Improve brain efficiency bу 75i',
      price: 16,
      category: 'Chess',
      imgUrl: 'assets/images/thinkingcap.jpg',
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p3',
      title: 'Kayak',
      description: 'А boat for one person',
      price: 275,
      category: 'Watersports',
      imgUrl: 'assets/images/kayak.jpg',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p1',
      title: 'Lifejacket',
      description: 'Protective and fashionable',
      price: 48.95,
      category: 'Watersports',
      imgUrl: 'assets/images/lifejacket.jpg',
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p2',
      title: 'Soccer Ball',
      description: 'FIFA-approved size and weight',
      price: 19.50,
      category: 'Soccer',
      imgUrl: 'assets/images/soccerball.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p9',
      title: 'Bling-Bling King',
      description: 'Gold-plated, diamond-studded King',
      price: 1200,
      category: 'Chess',
      imgUrl: 'assets/images/blingblingking.jpg',
      color: '0xFFF8BBD0',
    ),
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
