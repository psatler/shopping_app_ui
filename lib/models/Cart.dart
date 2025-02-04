import 'package:flutter/material.dart';
import 'package:shopping_app/models/Product.dart';

class Cart {
  final Product product;
  final int numOfItems;

  Cart({
    @required this.product,
    @required this.numOfItems,
  });
}

// demo data
List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItems: 2),
  Cart(product: demoProducts[1], numOfItems: 1),
  Cart(product: demoProducts[2], numOfItems: 1),
  Cart(product: demoProducts[3], numOfItems: 1),
  Cart(product: demoProducts[4], numOfItems: 1),
  Cart(product: demoProducts[5], numOfItems: 1),
  Cart(product: demoProducts[6], numOfItems: 1),
];
