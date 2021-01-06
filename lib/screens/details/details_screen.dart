import 'package:flutter/material.dart';
import 'package:shopping_app/models/Product.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// we are using named routes, therefore, we create a class for the arguments
// to be passed when going to the details screen

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({
    @required this.product,
  });
}
