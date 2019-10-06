import 'package:e_commerce/widget/common.dart';
import 'package:e_commerce/widget/products_card.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blue dress",
      "pictures": "images/products/dress2.jpg",
      "on_sale": false,
      "price": 145.3,
      "brand": "Off-White"
    },
    {
      "name": "Joggers",
      "pictures": "images/products/pants1.jpg",
      "on_sale": true,
      "price": 523.5,
      "brand": "Nike"
    },
    {
      "name": "Blazer",
      "pictures": "images/products/blazer1.jpg",
      "on_sale": true,
      "price": 178.5,
      "brand": "Nike"
    },
    {
      "name": "Jimmy Choo Hill",
      "pictures": "images/products/hills1.jpg",
      "on_sale": true,
      "price": 987.1,
      "brand": "Nike"
    },
    {
      "name": "Black dress",
      "pictures": "images/products/dress1.jpg",
      "on_sale": false,
      "price": 315.3,
      "brand": "Nike"
    },
    {
      "name": "Kaki joggers",
      "pictures": "images/products/pants2.jpg",
      "on_sale": true,
      "price": 345.0,
      "brand": "Nike"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductCard(
                name: productList[index]['name'],
                price: productList[index]['price'],
                picture: productList[index]['pictures'],
                brand: productList[index]['brand'],
                onSale: productList[index]["on_sale"]),
          );
        });
  }
}
