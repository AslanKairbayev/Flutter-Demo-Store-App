import 'package:demo_app/presentation/screens/category/category_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final imgUrl;
  final category;
  final color;

  ProductCard({Key key, this.imgUrl, this.category, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final product = context.select((ProductModel value) => value);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryScreen(
                  category: category,
                ),
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text('${product.price}'),
          //       IconButton(
          //           icon: Icon(
          //             Icons.add_circle_outline,
          //             color: Colors.black12,
          //           ),
          //           onPressed: () {
          //             context.read<CartViewModel>().addItem(
          //                 productId: product.id,
          //                 price: product.price,
          //                 title: product.title,
          //                 imgUrl: product.imgUrl);
          //           }),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
