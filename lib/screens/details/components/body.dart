import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import 'product_images_carousel.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductImages(
      product: product,
    );
  }
}
