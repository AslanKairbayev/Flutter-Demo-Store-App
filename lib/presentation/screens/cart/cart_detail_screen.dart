import 'package:demo_app/presentation/screens/cart/widgets/cart_product_list.dart';
import 'package:demo_app/presentation/screens/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, model, child) => Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cart of happiness'),
          ),
          body: model.getCartItems.isEmpty
              ? Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(30),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text('Cart is empty'),
                  ),
                )
              : Column(
                  children: [
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'TotalCost: ' + model.totalAmount.toStringAsFixed(2),
                          style: TextStyle(fontSize: 20),
                        ),
                        MaterialButton(
                          onPressed: () {
                            model.clear();
                          },
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: Text('Buy'),
                        )
                      ],
                    ),
                    Divider(),
                    Expanded(
                      child: CartProductList(
                        model: model,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
