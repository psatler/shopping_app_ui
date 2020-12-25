import 'package:flutter/material.dart';

import 'splash_content.dart';

class Body extends StatelessWidget {
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Orange. Let's shop",
      "image": "assets/images/splash_1.png",
    },
    {
      "text": "We help people connect with stores \naround your location",
      "image": "assets/images/splash_2.png",
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double
            .infinity, // using SizedBox with width infinity to centralize it
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
