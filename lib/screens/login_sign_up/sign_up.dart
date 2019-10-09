import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/db/auth.dart';
import 'package:e_commerce/provider/user_provider.dart';

import 'package:e_commerce/screens/login_sign_up/custom_widget/custom_input_field.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/widget/common.dart';
import 'package:e_commerce/widget/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/db/users.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _fireStore = Firestore.instance;

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  UserServices _usersServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  String gender;
  String groupValue;

  bool loading = false;
  bool hidePassword = true;
  Auth _auth = Auth();

//  final progress = ProgressHUD.of(context);
//  progress.showWithText('Loading...');

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return new Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : Container(
              color: black,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'images/attractive_woman.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: Container(
                          height: 600.0,
                          child: ListView(
                            children: <Widget>[
                              CustomInputField(
                                isObscure: false,
                                fieldIcon: Icon(
                                  Icons.person,
                                  color: black,
                                ),
                                hintText: 'Full Name',
                                editingController: _nameTextController,
                                function: (value) {
                                  if (value.isEmpty) {
                                    return "The name field can not be emty";
                                  }

                                  return null;
                                },
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Male",
                                        style: TextStyle(color: white),
                                        textAlign: TextAlign.end,
                                      ),
                                      trailing: Radio(
                                        activeColor: white,
                                        value: "male",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "Female",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: white),
                                      ),
                                      trailing: Radio(
                                        value: "female",
                                        activeColor: white,
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CustomInputField(
                                isObscure: false,
                                fieldIcon: Icon(
                                  Icons.email,
                                  color: black,
                                ),
                                hintText: 'Email',
                                editingController: _emailTextController,
                                function: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }

                                  return null;
                                },
                              ),
                              CustomInputField(
                                isObscure: hidePassword,
                                fieldIcon: Icon(
                                  Icons.lock,
                                  color: black,
                                ),
                                hintText: 'Password',
                                editingController: _passwordTextController,
                                //TODO: Fix the show password function
                                iconButton: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = false;
                                        loading = false;
                                      });
                                    }),
                                function: (value) {
                                  if (value.isEmpty) {
                                    loading = false;

                                    return "The password field can not be emty";
                                  } else if (value.length < 6) {
                                    loading = false;

                                    return "The password has to be at leat 6 characters long";
                                  } else if (_passwordTextController.text !=
                                      value) {
                                    loading = false;

                                    return "the passwords do not match";
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 250,
                                  height: 50,
                                  child: RaisedButton(
                                      color: black,
                                      textColor: white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      //TODO: implementing Registration
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          if (!await user.signUp(
                                              _nameTextController.text,
                                              _emailTextController.text,
                                              _passwordTextController.text)) {
                                            _key.currentState.showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text("Faild Registration"),
                                              ),
                                            );
                                          }
                                        }
                                      }),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Already have an account',
                                      style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: Text(
                                  "Or sign up with",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      "images/facebook.png",
                                      width: 50,
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () async {
                                      FirebaseUser user =
                                          await _auth.googleSignIn();
                                      if (user != null) {
                                        _usersServices.createUser({
                                          "name": user.displayName,
                                          "photo": user.photoUrl,
                                          "email": user.email,
                                          "userId": user.uid
                                        });

                                        changeScreenReplacement(
                                            context, MyHomePage());
                                      }
                                    },
                                    child: Image.asset(
                                      "images/google.png",
                                      width: 50,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
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

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();

      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then(
              (user) => _fireStore.collection("users").add({
                "username": _nameTextController.text,
                "email": _emailTextController.text,
                "userId": user.user.uid,
                "gender": (gender.toString()),
              }),
            )
            .catchError(
              (err) => print(
                err.toString(),
              ),
            );

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
            ModalRoute.withName(MyHomePage().toString()));
      } else {
        print("already a user");
      }
    }
  }
}
