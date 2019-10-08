import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';

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
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'To Nigeria via E-commerce standers Shipping Estimated Delivery: ',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextSpan(
                      text: '9-10days',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                  style: TextStyle(color: Colors.blue),
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
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
