import 'package:e_commerce/provider/product.dart';
import 'package:e_commerce/provider/products_provider.dart';
import 'package:e_commerce/screens/details/product_detail_screen.dart';
import 'package:e_commerce/screens/home/product_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).items;
//    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      scrollDirection: Axis.horizontal,
      reverse: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        child: TrendingItem(),
        value: productsData[index],
      ),
      itemCount: productsData.length,
    );
  }
}

class TrendingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Container(
      height: 390.0,
      width: 350.0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
                child: Image.network(
                  product.imageUrl,
                  height: 330.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 10.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 8.0,
                  ),
                  width: 320.0,
                  color: Colors.black54,
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
                            text: '\$${product.price.toString()}',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
