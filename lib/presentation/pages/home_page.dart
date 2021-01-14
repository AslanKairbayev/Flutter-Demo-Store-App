import 'package:demo_app/presentation/providers/home_page_provider.dart';
import 'package:demo_app/presentation/widgets/bottom_bar.dart';
import 'package:demo_app/presentation/widgets/catalog.dart';
import 'package:demo_app/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.select((HomePageProvider value) => value.loadProducts());

    final products = context.watch<HomePageProvider>().getProducts;

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
              Container(
                child: ListTile(
                  title: Text(
                    'Fresh drinks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'More than 100 types cocktails',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),
              if (products != null)
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 290,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, int index) =>
                        ChangeNotifierProvider.value(
                      value: products[index],
                      child: ItemCard(),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Catalog of cocktails'),
              ),
              if (products != null)
                ...products.map((e) {
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
