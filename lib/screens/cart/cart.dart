import 'package:e_commerce/screens/cart/cart_products.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';

//My imports

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 6.0),
                  child: Container(
                    child: ListTile(
                      title: Text(
                        'Total:',
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "\$1090",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 23.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 44,
                    child: RaisedButton(
                      color: white,
                      textColor: black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      child: Text(
                        'CHECK OUT',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () async {},
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
