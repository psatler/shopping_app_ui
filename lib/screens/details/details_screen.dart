import 'package:flutter/material.dart';

import '../../models/Product.dart';
import '../../components/rounded_icon_button.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: RoundedIconButton(
          iconData: Icons.arrow_back,
          press: () => Navigator.pop(context),
        ),
      ),
    );
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
