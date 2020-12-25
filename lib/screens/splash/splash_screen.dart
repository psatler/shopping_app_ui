import 'package:flutter/material.dart';
import 'package:shopping_app/screens/splash/components/body.dart';
import 'package:shopping_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    // calling it on the first screen of the app
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
