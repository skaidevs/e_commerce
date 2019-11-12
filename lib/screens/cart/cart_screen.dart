import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/provider/orders.dart';
import 'package:e_commerce/screens/cart/cart_item.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => SingleCartProduct(
                title: cart.items.values.toList()[index].title,
                id: cart.items.values.toList()[index].id,
                productID: cart.items.keys.toList()[index],
                imageUrl: cart.items.values.toList()[index].imageUrl,
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quantity,
              ),
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
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
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
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
                    child: new OrderButton(cart: cart),
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

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).accentColor,
      textColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
      child: _isLoading
          ? CircularProgressIndicator()
          : Text(
              'CHECK OUT',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);

              setState(() {
                _isLoading = false;
              });

              widget.cart.clear();
              Navigator.of(context).pop();
            },
    );
  }
}
