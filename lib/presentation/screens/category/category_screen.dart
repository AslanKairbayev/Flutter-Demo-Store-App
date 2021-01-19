import 'package:demo_app/injection_container.dart';
import 'package:demo_app/presentation/enums/screen_state.dart';
import 'package:demo_app/presentation/models/product_model.dart';
import 'package:demo_app/presentation/screens/category/category_view_model.dart';
import 'package:demo_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final category;

  CategoryScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryViewModel _viewModel = serviceLocator<CategoryViewModel>();

  @override
  void initState() {
    _viewModel.loadProductsByCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryViewModel>(
      create: (context) => _viewModel,
      child: Consumer<CategoryViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(widget.category),
          ),
          body: model.state == ScreenState.Busy
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: const EdgeInsets.all(30),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1,
                    children: [
                      ...model.getProducts.map((e) => _buildItem(e)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildItem(ProductModel productModel) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(productModel.imgUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5),
          ],
          color: Colors.lime,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ProductDetailScreen(productId: productModel.id),
            ));
          },
          child: Text(
            productModel.title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                backgroundColor: Colors.black45),
          ),
        ),
      );
}
