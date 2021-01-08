import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import 'product_description.dart';
import 'product_images_carousel.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          widget: ProductDescription(
            product: product,
            pressOnSeeMore: () {},
          ),
        ),
      ],
    );
  }
}
