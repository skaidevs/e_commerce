import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/provider/product.dart';
import 'package:e_commerce/screens/details/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    return Container(
      height: 220.0,
      width: 200.0,
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: InkWell(
          onTap: () {},
          child: Container(
            color: Theme.of(context).primaryColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
//                      Navigator.of(context).pushNamed(
//                          ProductDetailScreen.routeName,
//                          arguments: product.id);
                    },
                    child: Image.network(
                      product.imageUrl,
                      height: 220,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.black45,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          ProductDetailScreen.routeName,
                          arguments: product.id);
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 160,
                        width: 200,
                        decoration: BoxDecoration(
                          // Box decoration takes a gradient
                          gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          ProductDetailScreen.routeName,
                          arguments: product.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            _listItemTitle(product.title),
                            _listItemTitle('\$${product.price.toString()}')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listItemTitle(String title) {
    return new Flexible(
      fit: FlexFit.loose,
      child: Text(
        "$title",
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }
}
