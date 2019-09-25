import 'package:e_commerce/pages/custom_ui/Custom_input_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  String gender;
  String groupValue = "male";

  bool loading = false;

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
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomInputFiled(
                      isObscure: false,
                      fieldIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: 'Full Name',
                      editingController: _nameTextController,
                      function: (value) {
                        if (value.isEmpty) {
                          return "The password field can not be emty";
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
                    CustomInputFiled(
                      isObscure: false,
                      fieldIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: 'Email',
                      editingController: _emailTextController,
                      function: (value) {
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
                    CustomInputFiled(
                      isObscure: true,
                      fieldIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Password',
                      editingController: _passwordTextController,
                      function: (value) {
                        if (value.isEmpty) {
                          return "The password field can not be emty";
                        } else if (value.length < 6) {
                          return "The password has to be at leat 6 characters long";
                        }

                        return null;
                      },
                    ),
                    CustomInputFiled(
                      isObscure: true,
                      fieldIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Confirm Password',
                      editingController: _confirmPasswordTextController,
                      function: (value) {
                        if (value.isEmpty) {
                          return "The password field can not be emty";
                        } else if (value.length < 6) {
                          return "The password has to be at leat 6 characters long";
                        }

                        return null;
                      },
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
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          //TODO: implementing an authentication function(check if user is Auth)
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22),
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

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
      } else if (e == "female") {
        groupValue = e;
      }
    });
  }
}

//class _SignUpState extends State<SignUp> {
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  final _formKey = GlobalKey<FormState>();
//  TextEditingController _emailTextController = TextEditingController();
//  TextEditingController _passwordTextController = TextEditingController();
//  TextEditingController _nameTextController = TextEditingController();
//  TextEditingController _confirmPasswordTextController =
//      TextEditingController();
//  String gender;
//  String groupValue = "male";
//
//  bool loading = false;
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
//            padding: const EdgeInsets.only(top: 160.0),
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
//                              hintText: "Full name",
//                              icon: Icon(Icons.person),
//                            ),
//                            controller: _nameTextController,
//                            validator: (value) {
//                              if (value.isEmpty) {
//                                return "The password field can not be emty";
//                              }
//
//                              return null;
//                            },
//                          ),
//                        ),
//                      ),
//                    ),
//                    Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: ListTile(
//                            title: Text(
//                              "Male",
//                              style: TextStyle(color: Colors.white),
//                              textAlign: TextAlign.end,
//                            ),
//                            trailing: Radio(
//                              activeColor: Colors.white,
//                              value: "male",
//                              groupValue: groupValue,
//                              onChanged: (e) => valueChanged(e),
//                            ),
//                          ),
//                        ),
//                        Expanded(
//                          child: ListTile(
//                            title: Text(
//                              "Female",
//                              textAlign: TextAlign.end,
//                              style: TextStyle(color: Colors.white),
//                            ),
//                            trailing: Radio(
//                              value: "female",
//                              activeColor: Colors.white,
//                              groupValue: groupValue,
//                              onChanged: (e) => valueChanged(e),
//                            ),
//                          ),
//                        ),
//                      ],
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
//                        borderRadius: BorderRadius.circular(10.0),
//                        color: Colors.white.withOpacity(0.8),
//                        elevation: 0.0,
//                        child: Padding(
//                          padding: const EdgeInsets.only(left: 12.0),
//                          child: TextFormField(
//                            obscureText: true,
//                            decoration: InputDecoration(
//                              hintText: "Confirm Password ",
//                              icon: Icon(Icons.lock),
//                            ),
//                            keyboardType: TextInputType.emailAddress,
//                            controller: _confirmPasswordTextController,
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
//                            "Sign up",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 15.0),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: InkWell(
//                        child: Text(
//                          'Login',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(color: Colors.white, fontSize: 18.0),
//                        ),
//                        onTap: () {
//                          Navigator.pop(context);
//                        },
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
//
//  valueChanged(e) {
//    setState(() {
//      if (e == "male") {
//        groupValue = e;
//      } else if (e == "female") {
//        groupValue = e;
//      }
//    });
//  }
//}
