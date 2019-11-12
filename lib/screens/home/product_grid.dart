import 'package:e_commerce/provider/products_provider.dart';
import 'package:e_commerce/screens/details/detail_custom_item.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/screens/home/product_grid_item.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  ProductGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        child: ProductGridItem(),
        value: products[index],
      ),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}
