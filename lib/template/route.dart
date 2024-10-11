import 'package:flutter/material.dart';
import 'package:quickmart/feature/splash_screen/splash_screen.dart';

class RouteName {
  static const String splashScreen = "/";
  static const String onBoarding = "/onBoarding";
  static const String signUp = "/signup";
  static const String signIn = "/signin";
}

final Map<String, Widget Function(BuildContext)> route = {
  RouteName.splashScreen: (context) => const SplashScreen()
};