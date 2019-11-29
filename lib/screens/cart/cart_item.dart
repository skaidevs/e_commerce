import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CartProductItem extends StatelessWidget {
  final String id;
  final double price;
  final String imageUrl;
  final int quantity;
  final String title;

  CartProductItem({
    this.id,
    this.price,
    this.imageUrl,
    this.quantity,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100.0,
              height: 110.0,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final String id;
  final String productID;
  final double price;
  final String imageUrl;
  final int quantity;
  final String title;
  final String color;
  final int size;

  SingleCartProduct({
    this.id,
    this.productID,
    this.price,
    this.imageUrl,
    this.quantity,
    this.title,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('CANCEL'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('DELETE'),
              ),
            ],
            title: Text('Are you sure?'),
            content: Text('Do you want to delete the item from the cart?'),
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productID);
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 80.0,
                height: 80.0,
                child: Image.network(
                  imageUrl,
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
                      title,
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
                          size.toString(),
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
                          color,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$${(price * quantity).toStringAsFixed(2)}',
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
//                  IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Qty ${quantity.toString()}x',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
//                  IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
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
