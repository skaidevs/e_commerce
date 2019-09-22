import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      "name": "Blue dress",
      "pictures": "images/products/dress2.jpg",
      "price": "110",
      "size": "M",
      "color": "Blue",
      "quantity": 1,
    },
    {
      "name": "Joggers",
      "pictures": "images/products/pants1.jpg",
      "price": "67",
      "size": "XL",
      "color": "Black",
      "quantity": 3,
    },
    {
      "name": "Jimmy Choo Hill",
      "pictures": "images/products/hills1.jpg",
      "price": "70",
      "size": "39",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Black dress",
      "pictures": "images/products/dress1.jpg",
      "price": "50",
      "size": "S",
      "color": "Black",
      "quantity": 2,
    },
    {
      "name": "Adidas",
      "pictures": "images/products/shoe1.jpg",
      "price": "210",
      "size": "12UK",
      "color": "Grey",
      "quantity": 1,
    },
    {
      "name": "Kaki pants",
      "pictures": "images/products/pants2.jpg",
      "price": "107",
      "size": "34W/L",
      "color": "Kaki Green",
      "quantity": 3,
    },
    {
      "name": "Tommy Hill",
      "pictures": "images/products/hills2.jpg",
      "price": "70",
      "size": "39",
      "color": "Red & Black",
      "quantity": 1,
    },
    {
      "name": "Black dress",
      "pictures": "images/products/dress1.jpg",
      "price": "50",
      "size": "S",
      "color": "Black",
      "quantity": 2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cartProductName: productsOnTheCart[index]["name"],
          cartProductPicture: productsOnTheCart[index]["pictures"],
          cartProductPrice: productsOnTheCart[index]["price"],
          cartProductSize: productsOnTheCart[index]["size"],
          cartProductColor: productsOnTheCart[index]["color"],
          cartProductQuantity: productsOnTheCart[index]["quantity"],
        );
      },
      itemCount: productsOnTheCart.length,
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProductName;
  final cartProductPicture;
  final cartProductPrice;
  final cartProductSize;
  final cartProductColor;
  final cartProductQuantity;

  SingleCartProduct(
      {this.cartProductName,
      this.cartProductPicture,
      this.cartProductPrice,
      this.cartProductSize,
      this.cartProductColor,
      this.cartProductQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 80.0,
                height: 80.0,
                child: Image.asset(
                  cartProductPicture,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cartProductName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Size: "),
                        Text(
                          cartProductSize,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Color: "),
                        Text(
                          cartProductColor,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "\$$cartProductPrice",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(00.0, 0.0, 6.0, 0.0),
              child: Column(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
                  Text(
                    "$cartProductQuantity",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*@override
Widget build(BuildContext context) {
  return Card(
    child: ListTile(
      contentPadding: EdgeInsets.all(10.0),
      //===== leading section
      leading: Container(
        width: 80.0,
        height: 80.0,
        child: Image.asset(
          cartProductPicture,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        cartProductName,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              //=====Size section
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text('Size:'),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  cartProductSize,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),

              //=====Color section
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                child: Text('Color:'),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  cartProductColor,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          //====== Product price section
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "\$$cartProductPrice",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      trailing: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
            Text(
              "$cartProductQuantity",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
          ],
        ),
      ),
    ),
  );
}
}*/
