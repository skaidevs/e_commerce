import 'package:e_commerce/provider/user_provider.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/screens/login_sign_up/sign_up.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:e_commerce/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'custom_widget/custom_input_field.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  final _auth = FirebaseAuth.instance;

  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return new Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : Container(
              ///MediaQ is use to get width & height of thr screen
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'images/attractive_woman.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Form(
                    key: _formKey,
                    child: Center(
                      child: Container(
                        width: 500,
                        height: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
//                    Material(
//                      elevation: 10.0,
//                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
//                      child: Image.asset(
//                        'images/logo.png',
//                        width: 120,
//                        height: 120,
//                      ),
//                    ),
                            SizedBox(
                              height: 50,
                            ),
                            CustomInputField(
                              isObscure: false,
                              fieldIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: 'Email',
                              editingController: _emailTextController,
                              function: (value) {
                                if (value.isEmpty) {
                                  loading = false;

                                  return "The email field cannot be emty";
                                }
                                return null;
                              },
                            ),
                            CustomInputField(
                              isObscure: hidePassword,
                              fieldIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Password',
                              editingController: _passwordTextController,
                              iconButton: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = false;
                                    });
                                  }),
                              function: (value) {
                                if (value.isEmpty) {
                                  loading = false;

                                  return "The password field can not be emty";
                                }
                                return null;
                              },
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.only(right: 26.0),
                              child: Text(
                                'Forgotten Password?',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                child: RaisedButton(
                                  color: black,
                                  textColor: white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Text(
                                    'login',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  //TODO: implementing an authentication function(check if user is Auth)
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      if (!await user.signIn(
                                          _emailTextController.text,
                                          _passwordTextController.text)) {
                                        _key.currentState.showSnackBar(
                                          SnackBar(
                                            content: Text("Faild Sign in"),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Don\'t\ have an accout?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 8.0)),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      color: black,
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Center(
                              child: Text(
                                "Other Sign in options",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                MaterialButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                    "images/facebook.png",
                                    width: 50,
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                    "images/google.png",
                                    width: 50,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: loading ?? true,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

/*FormState formState = _formKey.currentState;
                                  final progress = ProgressHUD.of(context);
                                  progress.showWithText('Loading...');

                                  if (formState.validate()) {
                                    try {
                                      final user = await _auth
                                          .signInWithEmailAndPassword(
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text);

                                      if (user != null) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MyHomePage(),
                                          ),
                                        );

                                        progress.dismiss();
                                      } else {
                                        print("you have to register");
                                        progress.dismiss();
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                  progress.dismiss();*/
