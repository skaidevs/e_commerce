import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "pictures": "images/products/blazer1.jpg",
      "old_price": "120",
      "price": "85",
    },
    {
      "name": "Black Dress",
      "pictures": "images/products/dress1.jpg",
      "old_price": "100",
      "price": "50",
    }
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
    return Container(
      child: Card(
        child: Hero(
            tag: productName,
            child: Material(
              child: InkWell(
                onTap: () {},
                child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        productName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$productPrice",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$productOldPrice",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    productPicture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
