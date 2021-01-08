import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import 'colors_dot.dart';
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
    return ListView(
      children: [
        Column(
          children: [
            ProductImages(product: product),
            TopRoundedContainer(
              color: Colors.white,
              widget: Column(
                children: [
                  ProductDescription(
                    product: product,
                    pressOnSeeMore: () {},
                  ),
                  TopRoundedContainer(
                    color: Color(0xFFF6F7F9),
                    widget: ColorDots(product: product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
