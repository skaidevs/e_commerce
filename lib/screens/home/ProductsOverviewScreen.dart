import 'package:e_commerce/provider/products_provider.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/home/custom_widget/featured_item.dart';
import 'package:e_commerce/screens/home/custom_widget/search.dart';
import 'package:e_commerce/screens/home/custom_widget/trending_products.dart';
import 'package:e_commerce/screens/home/product_grid.dart';
import 'package:e_commerce/widget/custom_list_items_horizontal.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/app_drawer.dart';
import 'package:e_commerce/widget/badge.dart';
import 'package:e_commerce/widget/common.dart';

enum FiltersOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoritesOnly = false;
  var _isLoading = false;

  void fitchData() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration(seconds: 1)).then((_) async {
      await Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    fitchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final cartData = Provider.of<Cart>(context);

    final products =
        _showFavoritesOnly ? productsData.favoriteItems : productsData.items;

    Widget _buildTitleText(String text) {
      return Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: new Text(
                text,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor, //change your color here
        ),
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FiltersOptions selectedValue) {
              setState(() {
                if (selectedValue == FiltersOptions.Favorites) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show Favorites'),
                value: FiltersOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FiltersOptions.All,
              ),
            ],
          ),
          IconButton(
              icon: Icon(
                Icons.person,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {}),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              child: ch,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).accentColor,
              ),
              onPressed: (cartData.items.isEmpty)
                  ? null
                  : () {
                      Navigator.of(context).pushNamed(
                        CartScreen.routeName,
                      );
                    },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Theme.of(context).primaryColor,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.black87,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Looking for something specific?',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),

//          Search Text field
                      Search(),

                      // featured products
                      _buildTitleText('Featured Products'),
                      ProductCustomListItems(
                        FeaturedItem(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      // Trending products
                      _buildTitleText('Trending'),
                      SizedBox(
                        height: 300.0,
                        child: TrendingProducts(),
                      ),
                      _buildTitleText('Recent Products'),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(child: ProductGrid(_showFavoritesOnly)),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
