import 'package:e_commerce/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCustomListItems extends StatelessWidget {
  final Widget widget;

  ProductCustomListItems(this.widget);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).items;
//  final products = showFavs ? productsData.favoriteItems : productsData.items;

    return Container(
      color: Colors.white10,
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          child: widget,
          value: productsData[index],
        ),
        itemCount: productsData.length,
      ),
    );
  }
}
