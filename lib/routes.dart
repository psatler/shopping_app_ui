import 'package:flutter/material.dart';

import './screens/sign_in/sign_in_screen.dart';
import './screens/splash/splash_screen.dart';
import './screens/forgot_password/forgot_password_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};
