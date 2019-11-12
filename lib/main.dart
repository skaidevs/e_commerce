import 'package:e_commerce/provider/orders.dart';
import 'package:e_commerce/provider/products_provider.dart';
import 'package:e_commerce/provider/user_provider.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/details/product_detail_screen_2.dart';
import 'package:e_commerce/screens/home/ProductsOverviewScreen.dart';
import 'package:e_commerce/screens/login_sign_up/login.dart';
import 'package:e_commerce/screens/details/product_detail_screen.dart';
import 'package:e_commerce/screens/managing_user_products/edit_product_screen.dart';
import 'package:e_commerce/screens/managing_user_products/user_products_screen.dart';
import 'package:e_commerce/screens/orders/orders_screen.dart';
import 'package:e_commerce/widget/splash.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(color: Colors.green),
            ),
            backgroundColor: black,
            primaryColor: black,
            primarySwatch: Colors.green,
//            unselectedWidgetColor: white,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          ProductDetailScreen2.routeName: (context) => ProductDetailScreen2(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
        },
      ),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

//    if (user.status == Status.Uninitialized) {
//      return Splash();
//    } else if (user.status == Status.Authenticating) {
//      return Login();
//    } else if (user.status == Status.Authenticating) {
//      return SignUp();
//    }else if (user.status == Status.Authenticated) {
//      return MyHomePage();
//    }
//
//    return Login();

    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return ProductOverviewScreen();
      default:
        return Login();
    }
  }
}
