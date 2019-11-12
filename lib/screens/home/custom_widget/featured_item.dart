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
    return Container(
      color: Theme.of(context).primaryColor,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.black54,
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
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: '${product.title} \n',
                              style: TextStyle(fontSize: 18),
                            ),
                            TextSpan(
                              text: 'On Sale \n',
                              style: TextStyle(fontSize: 18),
                            ),
                            TextSpan(
                              text: '\$${product.price.toString()} \n',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ]),
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
}
