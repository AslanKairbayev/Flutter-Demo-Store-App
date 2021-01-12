import 'package:demo_app/models/Cart.dart';
import 'package:demo_app/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart of happiness'),
        ),
        body: cartData.cartItems.isEmpty
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
                        'TotalCost: ' + cartData.totalAmount.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20),
                      ),
                      MaterialButton(
                        onPressed: () {
                          cartData.clear();
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text('Buy'),
                      )
                    ],
                  ),
                  Divider(),
                  Expanded(
                    child: CartItemList(
                      cartData: cartData,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
