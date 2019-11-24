import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/provider/product.dart';
import 'package:e_commerce/screens/details/product_detail_screen_2.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String dummyText =
    "What is Lorem Ipsum? Lorem Ipsum nis simply dummy text of the pr"
    "inting and typesetting industry. Lorem Ipsum has been the industry's' "
    "to make a type specimen book. It has survived not only five centuries.";

//Shipping Information
class CustomShippingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  'Free Shipping',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'To Nigeria via E-commerce standers Shipping Estimated Delivery: ',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    TextSpan(
                      text: '9-10days',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String descriptionText;

  Description({this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  'Item Description',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: white),
                ),
              ),
            ),
            Container(
              child: Card(
                color: Colors.white10,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: descriptionText,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//This holds "YOU MIGHT ALSO LIKE" & RECENTLY VIEWED
class CustomMoreItems extends StatelessWidget {
  final Widget widget;
  final Widget widget2;

  CustomMoreItems(this.widget, this.widget2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
          child: widget,
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
        SizedBox(height: 200.0, child: widget2),
      ],
    );
  }
}

// This widget holds the Color, Price, Size and Quantity.
class CustomCPSQ extends StatelessWidget {
  final String price;

  CustomCPSQ(this.price);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          child: Text(
            '\$$price',
            style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
        ),
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
    );
  }
}

//This holds "MORE ITEM" & RECENTLY VIEWED
class MoreItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    return Container(
      height: 170.0,
      width: 160.0,
      color: Theme.of(context).primaryColor,
      child: Card(
        color: Colors.white12,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetailScreen2.routeName,
                    arguments: product.id,
                  );
                },
                child: Container(
                  height: 170.0,
                  width: 160.0,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '\$${product.price.toString()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              product.title,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Consumer<Product>(
                        builder: (context, product, child) => GestureDetector(
                          child: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Theme.of(context).accentColor,
                          ),
                          onTap: () {
                            product.toggleFavorite(
                              auth.token,
                              auth.userId,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
