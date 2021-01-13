import 'package:demo_app/models/Product2.dart';
import 'package:demo_app/widgets/bottom_bar.dart';
import 'package:demo_app/widgets/catalog.dart';
import 'package:demo_app/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fresh drinks',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              // Container(
              //   child: ListTile(
              //     title: Text(
              //       'Fresh drinks',
              //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              //     ),
              //     subtitle: Text(
              //       'More than 100 types cocktails',
              //       style: TextStyle(fontSize: 16),
              //     ),
              //     trailing: Icon(Icons.panorama_horizontal),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.all(5),
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                  itemBuilder: (context, int index) =>
                      ChangeNotifierProvider.value(
                    value: productData.items[index],
                    child: ItemCard(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Catalog of cocktails'),
              ),
              ...productData.items.map((e) {
                return CatalogListTile(imgUrl: e.imgUrl);
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
