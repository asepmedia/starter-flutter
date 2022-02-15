import 'package:flutter/material.dart';
import 'package:todoapp/screens/auth/login_screen.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/main_screen.dart';
import 'package:todoapp/screens/welcome_screen.dart';

class Route {
  static Map<String, Widget Function(BuildContext)> lists() {
    return {
      (WelcomeScreen).toString(): (ctx) => WelcomeScreen(),
      (MainScreen).toString(): (ctx) => MainScreen(),
      (LoginScreen).toString(): (ctx) => LoginScreen(),
      (HomeScreen).toString(): (ctx) => HomeScreen(),
    };
  }
}
