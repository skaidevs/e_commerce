import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  String gender;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/attractive_woman.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
          ),
//          Container(
//            alignment: Alignment.topLeft,
//            padding: EdgeInsets.only(top: 60.0),
//            child: Image.asset(
//              'images/logo.png',
//              width: 180.0,
//              height: 140.0,
//            ),
//          ),
          Padding(
            padding: const EdgeInsets.only(top: 220.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Full name",
                              icon: Icon(Icons.person),
                            ),
                            controller: _nameTextController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field can not be emty";
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailTextController,
                            validator: (value) {
                              if (value.isEmpty) {
                                Pattern pattern = "((#(:'\\\//>??><][";
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch((value))) {
                                  return 'Please make sure your email is valied';
                                } else {
                                  return null;
                                }
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(Icons.lock),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _passwordTextController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field can not be emty";
                              } else if (value.length < 6) {
                                return "The password has to be at leat 6 characters long";
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confirm Password ",
                              icon: Icon(Icons.lock),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _confirmPasswordTextController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field can not be emty";
                              } else if (value.length < 6) {
                                return "The password has to be at leat 6 characters long";
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
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
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
