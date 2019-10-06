import 'package:e_commerce/db/Products.dart';
import 'package:e_commerce/widget/featured_products.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/search.dart';

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => Cart(),
//                  ),
//                );
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
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => Cart(),
//                  ),
//                );
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

            Divider(),

            InkWell(
              onTap: () {
//                FirebaseAuth.instance.signOut().then((value) {
//                  Navigator.pushReplacement(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => Login(),
//                    ),
//                  );
//                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(
                  Icons.transit_enterexit,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Looking for something specific?',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),

                //          Search Text field
                Search(),

//            featured products
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: new Text('Featured products')),
                    ),
                  ],
                ),
                FeaturedProducts(),

//          recent products
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: new Text('Recent products')),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 400.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
