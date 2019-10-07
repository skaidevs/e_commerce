import 'package:e_commerce/screens/login_sign_up/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black, unselectedWidgetColor: Colors.white),
      home: Login(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress HUD'),
      ),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Show for a second'),
                  onPressed: () {
                    final progress = ProgressHUD.of(context);
                    progress.show();
                    Future.delayed(Duration(seconds: 1), () {
                      progress.dismiss();
                    });
                  },
                ),
                RaisedButton(
                  child: Text('Show with text'),
                  onPressed: () {
                    final progress = ProgressHUD.of(context);
                    progress.showWithText('Loading...');
                    Future.delayed(Duration(seconds: 1), () {
                      progress.dismiss();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
