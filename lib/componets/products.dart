import 'package:flutter/material.dart';
import 'package:e_commerce/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blue dress",
      "pictures": "images/products/dress2.jpg",
      "old_price": "230",
      "price": "110",
    },
    {
      "name": "Joggers",
      "pictures": "images/products/pants1.jpg",
      "old_price": "90",
      "price": "67",
    },
    {
      "name": "Blazer",
      "pictures": "images/products/blazer1.jpg",
      "old_price": "120",
      "price": "85",
    },
    {
      "name": "Jimmy Choo Hill",
      "pictures": "images/products/hills1.jpg",
      "old_price": "110",
      "price": "70",
    },
    {
      "name": "Black dress",
      "pictures": "images/products/dress1.jpg",
      "old_price": "100",
      "price": "50",
    },
    {
      "name": "Kaki joggers",
      "pictures": "images/products/pants2.jpg",
      "old_price": "310",
      "price": "270",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['pictures'],
            productOldPrice: productList[index]['old_price'],
            productPrice: productList[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;
  SingleProduct(
      {this.productName,
      this.productPicture,
      this.productOldPrice,
      this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                //Passing the values of the product to the product details page
                builder: (context) => ProductDetails(
                  productDetailName: productName,
                  productDetailNewPrice: productPrice,
                  productDetailOldPrice: productOldPrice,
                  productDetailPicture: productPicture,
                ),
              ),
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    Text(
                      "\$$productPrice",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
