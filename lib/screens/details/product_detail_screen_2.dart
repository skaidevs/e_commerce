import 'package:e_commerce/provider/products_provider.dart';
import 'package:e_commerce/screens/details/detail_custom_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen2 extends StatelessWidget {
  static const routeName = '/product_detail_screen2';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; //is the id!
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
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
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.shopping_cart,
                        ),
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
                          ),
                          Description(),
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
                    onPressed: () async {},
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
                  child: Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).accentColor,
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
