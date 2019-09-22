import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
//My imports
import 'package:e_commerce/componets/horizontal_listview.dart';
import 'componets/products.dart';
import 'package:e_commerce/pages/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String money;

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/w.jpg'),
          AssetImage('images/c1.jpg'),
          AssetImage('images/w1.jpg'),
          AssetImage('images/w3.jpg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/m1.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 8.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text('Store'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //Header
            UserAccountsDrawerHeader(
              accountName: Text('Skai Devs'),
              accountEmail: Text('skaidevs@mail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.black),
            ),
            //Body
            // This is the body of the home page
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page '),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Order'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          imageCarousel,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
          ),
          //Horizontal List View
          HorizontalList(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Recent Products',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
          ),
          //Grid View
          Container(
            height: 380.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}
