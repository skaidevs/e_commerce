import 'package:e_commerce/widget/common.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
