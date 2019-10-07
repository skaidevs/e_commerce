import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageURL;

  ProductImage(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 16.3,
      child: Image.asset(
        imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}
