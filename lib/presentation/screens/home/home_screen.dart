import 'package:demo_app/injection_container.dart';
import 'package:demo_app/presentation/enums/screen_state.dart';
import 'package:demo_app/presentation/screens/home/widgets/category.dart';
import 'package:demo_app/presentation/screens/home/home_view_model.dart';
import 'package:demo_app/presentation/screens/home/widgets/bottom_bar.dart';
import 'package:demo_app/presentation/screens/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel _viewModel = serviceLocator<HomeViewModel>();

  @override
  void initState() {
    _viewModel.loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => _viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Sports Store',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.white,
          body: model.state == ScreenState.Busy
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
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
                              'New Arrivals',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            subtitle: Text(
                              'More than 100 types products',
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: Icon(Icons.panorama_horizontal),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 250,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ProductCard(
                                category: 'Watersports',
                                imgUrl: 'assets/images/watersports.jpg',
                                color: Colors.blue[300],
                              ),
                              ProductCard(
                                  category: 'Soccer',
                                  imgUrl: 'assets/images/soccer.jpg',
                                  color: Colors.greenAccent),
                              ProductCard(
                                category: 'Chess',
                                imgUrl: 'assets/images/chess.jpg',
                                color: Colors.amberAccent,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('All products'),
                        ),
                        // if (model.getProducts != null)
                        // ...model.getProducts.map((e) {
                        //   return CategoryListTile(imgUrl: e.imgUrl);
                        // }).toList(),
                        ...model.getProducts.map((e) {
                          return CategoryListTile(
                            product: e,
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
