import 'package:e_commerce/pages/custom_ui/custom_input_field.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/db/users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _usersServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  String gender;
  String groupValue = "male";

  bool loading = false;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
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
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomInputField(
                      isObscure: false,
                      fieldIcon: Icon(
                        Icons.person,
                        color: Colors.black,
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
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                            trailing: Radio(
                              activeColor: Colors.white,
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
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Radio(
                              value: "female",
                              activeColor: Colors.white,
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
                        color: Colors.black,
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
                        color: Colors.black,
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
                        } else if (_passwordTextController.text != value) {
                          loading = false;

                          return "the passwords do not match";
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
                      hintText: 'Confirm Password',
                      editingController: _confirmPasswordTextController,
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
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 14),
                          width: 250,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.black,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            //TODO: implementing Registration
                            onPressed: () async {
                              await validateForm();
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 30),
                          child: InkWell(
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    )
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
              (users) => _usersServices.createUser({
                "username": _nameTextController.text.toString(),
                "email": _emailTextController.text.toString(),
                "userId": user.uid,
                "gender": gender,
              }),
            )
            .catchError(
              (err) => print(
                err.toString(),
              ),
            );
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }
  }
}
