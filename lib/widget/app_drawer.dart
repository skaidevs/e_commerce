import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/managing_user_products/user_products_screen.dart';
import 'package:e_commerce/screens/orders/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget drawer() => Drawer(
          child: ListView(
            children: <Widget>[],
          ),
        );

    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            //Header
//              AppBar(
//                title: Text('Hello DotApk'),
//                automaticallyImplyLeading: false,
//              ),
//              Divider(),
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
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: ListTile(
                title: Text(
                  'Home Page ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
            ),

//              InkWell(
//                onTap: () {},
//                child: ListTile(
//                  title: Text('My Account'),
//                  leading: Icon(Icons.person),
//                ),
//              ),

            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersScreen.routeName);
              },
              child: ListTile(
                title: Text(
                  'My Order',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              child: ListTile(
                title: Text(
                  'Shopping Cart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Favourites',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),

//            Divider(
//              color: Theme.of(context).accentColor,
//            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.help,
                  color: Colors.white,
                ),
              ),
            ),

            Divider(
              color: Theme.of(context).accentColor,
            ),

            InkWell(
              onTap: () {
//              user.signOut();
              },
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(UserProductsScreen.routeName);
                },
                title: Text(
                  'Manage Products',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),

            Divider(
              color: Theme.of(context).accentColor,
            ),

            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
//              user.signOut();
                Provider.of<Auth>(context, listen: false).logOut();
              },
              child: ListTile(
                title: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
