import 'package:e_commerce/widget/common.dart';
import 'package:e_commerce/widget/featured_products.dart';
import 'package:e_commerce/widget/products_card.dart';
import 'package:e_commerce/widget/search.dart';
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
    return SingleChildScrollView(
      child: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Looking for something specific?',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),

//          Search Text field
            Search(),

            //                featured products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        'Featured products',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: white),
                      )),
                ),
              ],
            ),
            FeaturedProducts(),

//                recent products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        'Recent products',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: white),
                      )),
                ),
              ],
            ),

            SizedBox(
              height: 200.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Center(
                    child: ProductCard(
                        name: productList[index]['name'],
                        price: productList[index]['price'],
                        picture: productList[index]['pictures'],
                        brand: productList[index]['brand'],
                        onSale: productList[index]["on_sale"]),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Center(
                    child: ProductCard(
                        name: productList[index]['name'],
                        price: productList[index]['price'],
                        picture: productList[index]['pictures'],
                        brand: productList[index]['brand'],
                        onSale: productList[index]["on_sale"]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
