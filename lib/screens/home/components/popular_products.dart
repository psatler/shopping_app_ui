import 'package:flutter/material.dart';
import 'package:shopping_app/screens/details/details_screen.dart';

import '../../../models/Product.dart';
import '../../../components/product_card.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...demoProducts.asMap().entries.map((item) {
                int index = item.key;
                Product product = item.value;

                if (index + 1 == demoProducts.length) {
                  // if is the last product, we don't add a space at the right side
                  return ProductCard(
                    product: product,
                    press: () => Navigator.pushNamed(
                        context, DetailsScreen.routeName,
                        arguments: ProductDetailsArguments(product: product)),
                  );
                }

                return Row(
                  children: [
                    ProductCard(
                      product: product,
                      press: () => Navigator.pushNamed(
                          context, DetailsScreen.routeName,
                          arguments: ProductDetailsArguments(product: product)),
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                );
              }).toList(),

              // ...List.generate(
              //   demoProducts.length,
              //   (index) {

              //     return ProductCard(
              //       product: demoProducts[index],
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
