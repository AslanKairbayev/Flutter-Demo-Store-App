import 'package:demo_app/domain/usecases/getProductById.dart';
import 'package:demo_app/presentation/enums/screen_state.dart';
import 'package:demo_app/presentation/models/product_model.dart';
import 'package:demo_app/presentation/screens/base_view_model.dart';

class ProductDetailViewModel extends BaseViewModel {
  final GetProductById _getProductById;

  ProductDetailViewModel(GetProductById getProductById)
      : _getProductById = getProductById;

  ProductModel _product;

  ProductModel get getProduct => _product;

  Future getProductById(String productId) async {
    setState(ScreenState.Busy);
    await Future.delayed(Duration(seconds: 0), () async {
      final result = await _getProductById.call(Params(productId: productId));
      final productProvider = ProductModel(
        id: result.id,
        title: result.title,
        description: result.description,
        price: result.price,
        color: result.color,
        imgUrl: result.imgUrl,
      );
      _product = productProvider;
    });
    setState(ScreenState.Idle);
  }
}
