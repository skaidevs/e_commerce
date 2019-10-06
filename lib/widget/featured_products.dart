import 'package:flutter/material.dart';

import 'featured_card.dart';

class FeaturedProducts extends StatefulWidget {
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  var featuredProductList = [
    {
      "name": "Blazer",
      "pictures": "images/products/blazer2.jpg",
      "price": 178.5,
    },
    {
      "name": "Jimmy Choo Hill",
      "pictures": "images/products/shoe1.jpg",
      "price": 987.1,
    },
    {
      "name": "Black dress",
      "pictures": "images/products/dress1.jpg",
      "price": 315.3,
    },
    {
      "name": "Kaki joggers",
      "pictures": "images/products/pants2.jpg",
      "price": 345.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: featuredProductList.length,
          itemBuilder: (BuildContext context, index) {
            return FeaturedCard(
              name: featuredProductList[index]['name'],
              price: featuredProductList[index]['price'],
              picture: featuredProductList[index]['pictures'],
            );
          }),
    );
  }
}
