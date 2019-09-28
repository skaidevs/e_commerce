import 'package:flutter/material.dart';

///CustomInputFiled can be used anywhere!!!
class CustomInputField extends StatefulWidget {
  final Icon fieldIcon;
  final String hintText;
  final bool isObscure;
  final TextEditingController editingController;
  final Function function;
  final IconButton iconButton;

  const CustomInputField(
      {Key key,
      this.fieldIcon,
      this.hintText,
      this.isObscure,
      this.editingController,
      this.function,
      this.iconButton})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new CustomInputState(fieldIcon, hintText, isObscure,
        editingController, function, iconButton);
  }
}

class CustomInputState extends State<CustomInputField> {
  Icon fieldIcon;
  String hintText;
  bool isObscure;
  TextEditingController controller;
  Function validator;
  IconButton iconButton;

  CustomInputState(this.fieldIcon, this.hintText, this.isObscure,
      this.controller, this.validator, this.iconButton);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.8),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ListTile(
            title: TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                hintText: hintText,
                icon: fieldIcon,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: controller,
              validator: validator,
            ),
            trailing: iconButton,
          ),
        ),
      ),
    );
  }
}

//validator: (value) {
//if (value.isEmpty) {
//Pattern pattern = "((#(:'\\\//>??><][";
//RegExp regex = new RegExp(pattern);
//if (!regex.hasMatch((value))) {
//return 'Please make sure your email is valied';
//} else {
//return null;
//}
//}
//
//return null;
//},
