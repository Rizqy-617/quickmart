import 'package:flutter/material.dart';
import 'package:quickmart/screen/auth/signin_screen.dart';
import 'package:quickmart/screen/auth/signup_screen.dart';
import 'package:quickmart/screen/home/home_main.dart';
import 'package:quickmart/screen/onboarding_screen/onboarding_screen.dart';
import 'package:quickmart/screen/splash_screen/splash_screen.dart';

class RouteName {
  static const String splashScreen = "/";
  static const String onBoarding = "/onBoarding";
  static const String signUp = "/signup";
  static const String signIn = "/signin";
  static const String home = "/home";
}

final Map<String, Widget Function(BuildContext)> route = {
  RouteName.splashScreen: (context) => const SplashScreen(),
  RouteName.onBoarding: (context) =>  const OnboardingScreen(),
  RouteName.signUp: (context) => const SignupScreen(),
  RouteName.signIn: (context) =>  const SigninScreen(),
  RouteName.home: (context) => const HomeMain()
};

enum HomeTab { home, categories, cart, wishlist, profile }