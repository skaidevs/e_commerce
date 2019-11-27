import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/provider/product.dart';
import 'package:e_commerce/provider/products_provider.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/details/detail_custom_item.dart';
import 'package:e_commerce/widget/badge.dart';
import 'package:e_commerce/widget/custom_list_items_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/prodoct_detail';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; //is the id!
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    print(loadedProduct.quantity);

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Theme.of(context).accentColor, //change your color here
              ),
              actions: <Widget>[
                Row(
                  children: <Widget>[
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
                        onPressed: (cart.items.isEmpty)
                            ? null
                            : () {
                                Navigator.of(context)
                                    .pushNamed(CartScreen.routeName);
                              },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 18.0, 10.0),
                      child: Icon(Icons.share),
                    )
                  ],
                )
              ],
              expandedHeight: 360.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  height: 40,
                  color: Colors.black54,
                  child: Text(
                    loadedProduct.title,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                background: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                        children: <Widget>[
                          CustomCPSQ(
                            loadedProduct.price.toString(),
                            loadedProduct.quantity,
                            loadedProduct.size,
                            loadedProduct.color,
                          ),
                          Description(
                            descriptionText: loadedProduct.description,
                          ),
                          CustomShippingInfo(),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            child: Text(
                              'Recently Viewed',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            height: 34.0,
                          ),
                          ProductCustomListItems(
                            MoreItemCard(),
                          ),
                        ],
                      ),
                  childCount: 1),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 44,
                  width: 300.0,
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Text(
                      'ADD TO BAG',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: () async {
                      cart.addItem(
                        loadedProduct.id,
                        loadedProduct.price,
                        loadedProduct.title,
                        loadedProduct.imageUrl,
                      );

                      Fluttertoast.showToast(
                          msg: "Item added to cart!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Theme.of(context).accentColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      /*Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.black87,
                          content: Text(
                            'Item added to cart!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              cart.removeSingleItem(loadedProduct.id);
                            },
                          ),
                        ),
                      );*/
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.white10,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChangeNotifierProvider.value(
                    value: loadedProduct,
                    child: Consumer<Product>(
                      builder: (context, product, child) => GestureDetector(
                        child: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).accentColor,
                        ),
                        onTap: () {
                          product.toggleFavorite(
                            auth.token,
                            auth.userId,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
/*

ChangeNotifierProvider.value(
        child: ProductGridItem(),
        value: products[index],
      ),


      Consumer<Product>(
                    builder: (context, product, child) => IconButton(
                      icon: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        product.toggleFavorite();
                      },
                    ),
                  ),

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; //is the id!
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              Row(children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 18.0, 10.0),
                  child: Icon(Icons.share),
                ),
              ]),
            ],
            expandedHeight: 230,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 6,
                  bottom: 6,
                ),
                color: Colors.black87,
                child: Text(loadedProduct.title),
              ),
              background: Image.network(
                loadedProduct
                    .imageUrl, // <===   Add your own image to assets or use a .network image instead.
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 44,
                  width: 300.0,
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Text(
                      'ADD TO BAG',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () async {},
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite_border),
                ),
              ),
            ),
          ]),

//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
////          updateFavorites(appState.user.uid, widget.recipe.id).then((result) {
////            // Toggle "in favorites" if the result was successful.
////            if (result) _toggleInFavorites();
////          });
//        },
//        child: Icon(
//          _inFavorites ? Icons.favorite : Icons.favorite_border,
//          color: Theme.of(context).iconTheme.color,
//        ),
//        elevation: 2.0,
//        backgroundColor: Colors.white,
//      ),
        ),
      ),
    );
  }
}
*/
