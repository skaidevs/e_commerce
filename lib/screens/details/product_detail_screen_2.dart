import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/provider/product.dart';
import 'package:e_commerce/provider/products_provider.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/details/detail_custom_item.dart';
import 'package:e_commerce/widget/badge.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen2 extends StatefulWidget {
  static const routeName = '/product_detail_screen2';

  @override
  _ProductDetailScreen2State createState() => _ProductDetailScreen2State();
}

class _ProductDetailScreen2State extends State<ProductDetailScreen2> {
  int _selectedQty = 1;

  int _selectedSize;

  DropdownButton _customDown(
    List<DropdownMenuItem> qtyList,
    Function onChanged,
    int value,
    String text,
  ) =>
      DropdownButton(
        items: qtyList,
        onChanged: onChanged,
        value: value,

        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.green, fontSize: 16.0),
        underline: Container(
          height: 1,
          color: Colors.white,
        ),
//                  onChanged: (int newValue) {},
        hint: Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; //is the id!
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    List<DropdownMenuItem<int>> getQtyDropDown() {
      List<DropdownMenuItem<int>> items = List();
      for (int i = 0; i < loadedProduct.quantity.length; i++) {
        items.add(
          DropdownMenuItem(
            child: Text('QTY  ${loadedProduct.quantity[i]}'),
            value: loadedProduct.quantity[i],
          ),
        );
      }
      return items;
    }

    List<DropdownMenuItem<int>> getSizeDropDown() {
      List<DropdownMenuItem<int>> items = List();
      for (int i = 0; i < loadedProduct.size.length; i++) {
        items.add(
          DropdownMenuItem(
            child: Text('SIZE  ${loadedProduct.size[i]}'),
            value: loadedProduct.size[i],
          ),
        );
      }
      return items;
    }

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
                        onPressed: cart.items.isEmpty
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
                          Container(
                            color: Colors.white10,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  _customDown(getQtyDropDown(), (value) {
                                    setState(() {
                                      _selectedQty = value;
                                    });
                                  }, _selectedQty, 'QTY  '),

                                  SizedBox(
                                    width: 30,
                                  ),

                                  _customDown(getSizeDropDown(), (value) {
                                    setState(() {
                                      _selectedSize = value;
                                    });
                                  }, _selectedSize, 'SIZE  '),
                                  // the size button

                                  // the size button
                                ],
                              ),
                            ),
                          ),
                          Description(
                            descriptionText: loadedProduct.description,
                          ),
                          CustomShippingInfo(),
                        ],
                      ),
                  childCount: 1),
            )
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
                      if (_selectedSize == null) {
                        Fluttertoast.showToast(
                            msg: "Select Size!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Theme.of(context).accentColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        cart.addItem(
                          prodId: loadedProduct.id,
                          price: loadedProduct.price,
                          title: loadedProduct.title,
                          imageUrl: loadedProduct.imageUrl,
                          color: loadedProduct.color,
                          size: _selectedSize,
                          qty: _selectedQty,
                        );

                        Fluttertoast.showToast(
                            msg: "Item added to cart!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Theme.of(context).accentColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
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
