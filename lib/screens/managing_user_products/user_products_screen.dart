import 'package:e_commerce/provider/products_provider.dart';
import 'package:e_commerce/screens/managing_user_products/edit_product_screen.dart';
import 'package:e_commerce/screens/managing_user_products/user_product_item.dart';
import 'package:e_commerce/widget/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user_product_screen';
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                UserProductItem(
                  id: productData.items[index].id,
                  title: productData.items[index].title,
                  imageUrl: productData.items[index].imageUrl,
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
