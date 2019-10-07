import 'package:e_commerce/screens/home.dart';
import 'package:e_commerce/screens/sign_up.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widget/custom_widget/custom_input_field.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    await firebaseAuth.currentUser().then((user) {
      if (user != null) {
        setState(() => isLoggedIn = true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      }
    });

    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    //TODO: check if its true
    setState(() {
      loading = false;
    });

    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication authentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    FirebaseUser firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();

      final List<DocumentSnapshot> documents = result.documents;

      if (documents.length == 0) {
        // insert user to collection
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicure": firebaseUser.photoUrl,
        });

        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("profilePicture", firebaseUser.displayName);
      } else {
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("username", documents[0]["username"]);
        await preferences.setString(
            "profilePicture", documents[0]["profilePicture"]);
      }

      Fluttertoast.showToast(msg: "Successful");
      setState(() {
        loading = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      Fluttertoast.showToast(msg: "Unsuccessful :(");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
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
            Center(
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
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text(
                            'login',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          //TODO: implementing an authentication function(check if user is Auth)
                          onPressed: () async {
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text);

                              if (user != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              } else {
                                print("you have to register");
                              }
                            } catch (e) {
                              print(e);
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
                                  fontWeight: FontWeight.w700, color: white),
                            ),
                            Padding(padding: EdgeInsets.only(right: 8.0)),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
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
                          onPressed: () {
                            handleSignIn();
                          },
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
