import 'package:demo_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:demo_app/presentation/screens/cart/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatelessWidget {
  final index;

  CartProduct({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, model, child) => Container(
        child: ListTile(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                    productId: model.getCartItems.keys.toList()[index]),
              ));
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                      model.getCartItems.values.toList()[index].imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Text(model.getCartItems.values.toList()[index].title),
          subtitle:
              Text('Price: ${model.getCartItems.values.toList()[index].price}'),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
                icon: Icon(Icons.remove_circle_outline),
                color: Colors.red,
                onPressed: () {
                  model.updateItemsSubOne(
                      model.getCartItems.keys.toList()[index]);
                }),
            Text('x${model.getCartItems.values.toList()[index].number}'),
            IconButton(
                icon: Icon(Icons.add_circle_outline),
                color: Colors.blue,
                onPressed: () {
                  model.updateItemsAddOne(
                      model.getCartItems.keys.toList()[index]);
                }),
          ]),
        ),
      ),
    );
  }
}
