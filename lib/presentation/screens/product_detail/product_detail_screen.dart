import 'package:demo_app/injection_container.dart';
import 'package:demo_app/presentation/enums/screen_state.dart';
import 'package:demo_app/presentation/screens/cart/cart_detail_screen.dart';
import 'package:demo_app/presentation/screens/cart/cart_view_model.dart';
import 'package:demo_app/presentation/screens/product_detail/product_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  ProductDetailScreen({Key key, this.productId}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailViewModel _viewModel = serviceLocator<ProductDetailViewModel>();

  @override
  void initState() {
    _viewModel.getProductById(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductDetailViewModel>(
      create: (context) => _viewModel,
      child: Consumer<ProductDetailViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(model.getProduct != null ? model.getProduct.title : '',
                style: GoogleFonts.marmelad()),
          ),
          body: model.state == ScreenState.Busy
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: ListView(
                    children: [
                      if (model.getProduct != null)
                        Hero(
                          tag: model.getProduct.imgUrl,
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(model.getProduct.imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      if (model.getProduct != null)
                        Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Text(
                                  model.getProduct.title,
                                  style: TextStyle(fontSize: 26),
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Text('Price: ',
                                        style: TextStyle(fontSize: 24)),
                                    Text('${model.getProduct.price}',
                                        style: TextStyle(fontSize: 24)),
                                  ],
                                ),
                                Divider(),
                                Text(model.getProduct.description),
                                SizedBox(
                                  height: 20,
                                ),
                                context
                                        .watch<CartViewModel>()
                                        .getCartItems
                                        .containsKey(widget.productId)
                                    ? Column(
                                        children: [
                                          MaterialButton(
                                              color: Colors.blueAccent,
                                              textColor: Colors.white,
                                              child: Text('Go to cart'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      CartDetailScreen(),
                                                ));
                                              }),
                                          Text(
                                            'Item is already added to cart',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      )
                                    : MaterialButton(
                                        color: Theme.of(context).primaryColor,
                                        textColor: Colors.white,
                                        child: Text('Add to cart'),
                                        onPressed: () {
                                          context.read<CartViewModel>().addItem(
                                                productId: model.getProduct.id,
                                                price: model.getProduct.price,
                                                title: model.getProduct.title,
                                                imgUrl: model.getProduct.imgUrl,
                                              );
                                        }),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
