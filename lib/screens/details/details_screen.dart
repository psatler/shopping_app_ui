import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/custom_app_bar.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9), // another shade of white/greyish
      appBar: CustomAppBar(
        rating: arguments.product.rating,
      ),
      body: Body(
        product: arguments.product,
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
