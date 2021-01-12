import 'package:demo_app/models/Cart.dart';
import 'package:demo_app/models/Product.dart';
import 'package:demo_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String productId;

  ItemPage({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ProductDataProvider>(context).getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title, style: GoogleFonts.marmelad()),
      ),
      body: Container(
        child: ListView(
          children: [
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(fontSize: 26),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text('Price: ', style: TextStyle(fontSize: 24)),
                        Text('${data.price}', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    Divider(),
                    Text(data.description),
                    SizedBox(
                      height: 20,
                    ),
                    Provider.of<CartDataProvider>(context)
                            .cartItems
                            .containsKey(productId)
                        ? Column(
                            children: [
                              MaterialButton(
                                  color: Color(0xFFCCFF90),
                                  child: Text('Go to cart'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                    ));
                                  }),
                              Text(
                                'Item is already added to cart',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueGrey),
                              ),
                            ],
                          )
                        : MaterialButton(
                            color: Colors.amber,
                            child: Text('Add to cart'),
                            onPressed: () {
                              Provider.of<CartDataProvider>(context,
                                      listen: false)
                                  .addItem(
                                      productId: data.id,
                                      price: data.price,
                                      title: data.title,
                                      imgUrl: data.imgUrl);
                            }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
