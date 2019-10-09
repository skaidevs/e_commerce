import 'package:e_commerce/provider/user_provider.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/screens/login_sign_up/login.dart';
import 'package:e_commerce/screens/login_sign_up/sign_up.dart';
import 'package:e_commerce/widget/splash.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => UserProvider.initialize(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: black, unselectedWidgetColor: white),
        home: ScreensController(),
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
        return MyHomePage();
      default:
        return Login();
    }
  }
}
