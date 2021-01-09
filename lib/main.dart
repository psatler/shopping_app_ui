import 'package:flutter/material.dart';
import 'package:shopping_app/screens/profile/profile_screen.dart';

import 'routes.dart';
import 'screens/splash/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      initialRoute: ProfileScreen.routeName,
      // initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
