import 'package:demo_app/presentation/models/product_model.dart';
import 'package:demo_app/presentation/screens/cart/cart_view_model.dart';
import 'package:demo_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListTile extends StatelessWidget {
  final ProductModel product;

  CategoryListTile({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            productId: product.id,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(product.imgUrl),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5),
              ],
            ),
          ),
          title: Text(product.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: ${product.price}'),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amberAccent,
                  ),
                  Text('4.9'),
                ],
              ),
            ],
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
              ),
              onPressed: () {
                context.read<CartViewModel>().addItem(
                    productId: product.id,
                    price: product.price,
                    title: product.title,
                    imgUrl: product.imgUrl);
              }),
        ),
      ),
    );
  }
}
