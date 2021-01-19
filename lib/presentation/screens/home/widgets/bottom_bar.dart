import 'package:demo_app/presentation/screens/cart/cart_detail_screen.dart';
import 'package:demo_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:demo_app/presentation/screens/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, model, child) => BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2 + 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.getCartItems.length,
                  itemBuilder: (context, index) => Hero(
                    tag: context
                        .watch<CartViewModel>()
                        .getCartItems
                        .values
                        .toList()[index]
                        .imgUrl,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                              productId:
                                  model.getCartItems.keys.toList()[index]),
                        ));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 4,
                                  spreadRadius: 5,
                                  offset: Offset(-2, 2),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(model.getCartItems.values
                                    .toList()[index]
                                    .imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 2,
                            bottom: 5,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '${model.getCartItems.values.toList()[index].number}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2 - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(model.totalAmount.toStringAsFixed(2)),
                    IconButton(
                        icon: Icon(Icons.shopping_basket, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CartDetailScreen()),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
