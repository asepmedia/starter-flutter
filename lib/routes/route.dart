import 'package:flutter/material.dart';
import 'package:todoapp/screens/main_screen.dart';

class Route {
  static Map<String, Widget Function(BuildContext)> lists() {
    return {
      (MainScreen).toString(): (ctx) => MainScreen(),
    };
  }
}
