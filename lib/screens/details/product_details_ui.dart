import 'package:e_commerce/screens/details/featured_details_card.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String name;
  final double price;
  final String brand;
  final bool onSale;

  ProductDetailsScreen(this.name, this.price, this.brand, this.onSale);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var productList = [
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
                widget.name,
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.price.toString(),
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),

//          Search Text field
//            Search(),

            //                featured products
//            Row(
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Container(
//                      alignment: Alignment.centerLeft,
//                      child: new Text(
//                        'Featured products',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.w500,
//                            color: white),
//                      )),
//                ),
//              ],
//            ),

            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white10,
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "COLOR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white10,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('SIZE'),
                                      content: Text('Choose the Size'),
                                      actions: <Widget>[
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(context);
                                          },
                                          child: Text('CLOSE'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: Colors.white,
                            textColor: Colors.black87,
                            elevation: 0.2,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text("SIZE"),
                                ),
                                Expanded(
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 30,
                        ),
                        // the size button
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('QUANTITY'),
                                      content: Text('Choose the Quantity'),
                                      actions: <Widget>[
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(context);
                                          },
                                          child: Text('CLOSE'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: Colors.white,
                            textColor: Colors.black87,
                            elevation: 0.2,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text("QTY"),
                                ),
                                Expanded(
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // the size button
                      ],
                    ),
                  ),
                ),
              ],
            ),

//                YOU MIGHT ALSO LIKE
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        'YOU MIGHT ALSO LIKE',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
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
                itemBuilder: (BuildContext context, int index) =>
                    FeaturedDetailsCard(
                  name: productList[index]['name'],
                  price: productList[index]['price'],
                  picture: productList[index]['pictures'],
                  brand: productList[index]['brand'],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        'RECENTLY VIEWED',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
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
                reverse: false,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Center(
                    child: ProductCardDetail(
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

///
