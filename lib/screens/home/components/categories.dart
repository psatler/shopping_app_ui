import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/Flash Icon.svg",
        "text": "Flash Deal",
      },
      {
        "icon": "assets/icons/Bill Icon.svg",
        "text": "Bill",
      },
      {
        "icon": "assets/icons/Game Icon.svg",
        "text": "Game",
      },
      {
        "icon": "assets/icons/Gift Icon.svg",
        "text": "Daily Gift",
      },
      {
        "icon": "assets/icons/Discover.svg",
        "text": "More",
      },
    ];

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final String text;
  final String icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
