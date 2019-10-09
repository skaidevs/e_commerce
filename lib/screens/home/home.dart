import 'package:e_commerce/provider/user_provider.dart';
import 'package:e_commerce/screens/home/Products.dart';
import 'package:e_commerce/screens/cart/cart.dart';
import 'package:e_commerce/screens/login_sign_up/login.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:e_commerce/screens/home/custom_widget/featured_products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/home/custom_widget/search.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          actionsIconTheme: IconThemeData.fallback().copyWith(color: black),
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

              Divider(),

              InkWell(
                onTap: () {
                  user.signOut();
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
        body: Container(color: black, child: Products()));
  }
}
