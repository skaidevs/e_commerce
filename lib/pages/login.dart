import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'custom_ui/custom_input_filed.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//class _LoginState extends State<Login> {
//  final GoogleSignIn googleSignIn = new GoogleSignIn();
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  final _formKey = GlobalKey<FormState>();
//  TextEditingController _emailTextController = TextEditingController();
//  TextEditingController _passwordTextController = TextEditingController();
//
//  SharedPreferences preferences;
//  bool loading = false;
//  bool isLoggedIn = false;
//
//  @override
//  void initState() {
//    super.initState();
//    isSignedIn();
//  }
//
//  void isSignedIn() async {
//    setState(() {
//      loading = true;
//    });
//
//    preferences = await SharedPreferences.getInstance();
//    isLoggedIn = await googleSignIn.isSignedIn();
//
//    if (isLoggedIn) {
//      Navigator.pushReplacement(
//        context,
//        MaterialPageRoute(
//          builder: (context) => MyHomePage(),
//        ),
//      );
//    }
//
//    setState(() {
//      loading = false;
//    });
//  }
//
//  Future handleSignIn() async {
//    preferences = await SharedPreferences.getInstance();
//
//    setState(() {
//      loading = true;
//    });
//
//    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    GoogleSignInAuthentication authentication =
//        await googleSignInAccount.authentication;
//
//    AuthCredential credential = GoogleAuthProvider.getCredential(
//        idToken: authentication.idToken,
//        accessToken: authentication.accessToken);
//
//    FirebaseUser firebaseUser =
//        (await firebaseAuth.signInWithCredential(credential)).user;
//
//    if (firebaseUser != null) {
//      final QuerySnapshot result = await Firestore.instance
//          .collection("users")
//          .where("id", isEqualTo: firebaseUser.uid)
//          .getDocuments();
//
//      final List<DocumentSnapshot> documents = result.documents;
//
//      if (documents.length == 0) {
//        // insert user to collection
//        Firestore.instance
//            .collection("users")
//            .document(firebaseUser.uid)
//            .setData({
//          "id": firebaseUser.uid,
//          "username": firebaseUser.displayName,
//          "profilePicure": firebaseUser.photoUrl,
//        });
//
//        await preferences.setString("id", firebaseUser.uid);
//        await preferences.setString("username", firebaseUser.displayName);
//        await preferences.setString("profilePicture", firebaseUser.displayName);
//      } else {
//        await preferences.setString("id", documents[0]["id"]);
//        await preferences.setString("username", documents[0]["username"]);
//        await preferences.setString(
//            "iprofilePictured", documents[0]["profilePicture"]);
//      }
//
//      Fluttertoast.showToast(msg: "Successful");
//      setState(() {
//        loading = false;
//      });
//
//      Navigator.pushReplacement(
//        context,
//        MaterialPageRoute(builder: (context) => MyHomePage()),
//      );
//    } else {
//      Fluttertoast.showToast(msg: "Unsuccessful :(");
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Stack(
//        children: <Widget>[
//          Image.asset(
//            'images/attractive_woman.jpg',
//            fit: BoxFit.cover,
//            height: double.infinity,
//            width: double.infinity,
//            alignment: Alignment.center,
//          ),
//          Container(
//            color: Colors.black.withOpacity(0.2),
//            width: double.infinity,
//            height: double.infinity,
//          ),
////          Container(
////            alignment: Alignment.topLeft,
////            padding: EdgeInsets.only(top: 60.0),
////            child: Image.asset(
////              'images/logo.png',
////              width: 180.0,
////              height: 140.0,
////            ),
////          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 220.0),
//            child: Center(
//              child: Form(
//                key: _formKey,
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(10.0),
//                        color: Colors.white.withOpacity(0.8),
//                        elevation: 0.0,
//                        child: Padding(
//                          padding: const EdgeInsets.only(left: 12.0),
//                          child: TextFormField(
//                            decoration: InputDecoration(
//                              hintText: "Email",
//                              icon: Icon(Icons.email),
//                            ),
//                            keyboardType: TextInputType.emailAddress,
//                            controller: _emailTextController,
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                Pattern pattern = "((#(:'\\\//>??><][";
//                                RegExp regex = new RegExp(pattern);
//                                if (!regex.hasMatch((value))) {
//                                  return 'Please make sure your email is valied';
//                                } else {
//                                  return null;
//                                }
//                              }
//
//                              return null;
//                            },
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(10.0),
//                        color: Colors.white.withOpacity(0.8),
//                        elevation: 0.0,
//                        child: Padding(
//                          padding: const EdgeInsets.only(left: 12.0),
//                          child: TextFormField(
//                            obscureText: true,
//                            decoration: InputDecoration(
//                              hintText: "Password",
//                              icon: Icon(Icons.lock),
//                            ),
//                            keyboardType: TextInputType.emailAddress,
//                            controller: _passwordTextController,
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "The password field can not be emty";
//                              } else if (value.length < 6) {
//                                return "The password has to be at leat 6 characters long";
//                              }
//
//                              return null;
//                            },
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        color: Colors.black,
//                        elevation: 0.0,
//                        child: MaterialButton(
//                          onPressed: () {},
//                          minWidth: MediaQuery.of(context).size.width,
//                          child: Text(
//                            "Login",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 15.0),
//                          ),
//                        ),
//                      ),
//                    ),
//
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(
//                        "Forgot password?",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                            color: Colors.white, fontWeight: FontWeight.w400),
//                      ),
//                    ),
//
//                    Padding(
//                      padding: const EdgeInsets.only(top: 12.0),
//                      child: InkWell(
//                        child: Text(
//                          'Sign up',
//                          style: TextStyle(color: Colors.white, fontSize: 18.0),
//                        ),
//                        onTap: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => SignUp(),
//                            ),
//                          );
//                        },
//                      ),
//                    ),
//
//                    Expanded(
//                      child: Container(),
//                    ),
////                    Divider(),
//                    Text(
//                      "Other Sign in options",
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        color: Colors.red,
//                        elevation: 0.0,
//                        child: MaterialButton(
//                          onPressed: () {
//                            handleSignIn();
//                          },
//                          minWidth: MediaQuery.of(context).size.width,
//                          child: Text(
//                            "Google",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 15.0),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//          Visibility(
//            visible: loading ?? true,
//            child: Center(
//              child: Container(
//                alignment: Alignment.center,
//                child: CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
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
            "iprofilePictured", documents[0]["profilePicture"]);
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
                    CustomInputFiled(
                      isObscure: false,
                      fieldIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: 'Email',
                      editingController: _emailTextController,
                    ),
                    CustomInputFiled(
                      isObscure: true,
                      fieldIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Password',
                      editingController: _passwordTextController,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 26.0),
                      child: Text(
                        'Forgotten Password?',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text(
                            'login',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          //TODO: implementing an authentication function(check if user is Auth)
                          onPressed: () {},
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
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Padding(padding: EdgeInsets.only(right: 8.0)),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              color: Colors.black,
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Other Sign in options",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.red,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {
                            handleSignIn();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Sign in with Google",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      ),
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
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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
