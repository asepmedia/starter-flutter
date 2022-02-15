import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenHelper {
  static double percentOf(double value, double percentage) {
    return value * (percentage / 100);
  }

  static double scale(BuildContext ctx) {
    return MediaQuery.of(ctx).textScaleFactor;
  }

  static double width(BuildContext ctx, {double scale = 1}) {
    return MediaQuery.of(ctx).size.width * scale;
  }

  static double height(BuildContext ctx, {double scale = 1}) {
    return MediaQuery.of(ctx).size.height * scale;
  }

  static double fontSize(size, scale) {
    return size * scale;
  }

  static void navigate(BuildContext ctx, Widget widget) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return widget;
    }));
  }

  static void navigateTo(BuildContext ctx,
      {String name = '', Object? arguments}) {
    // Navigator.of(ctx).pushNamed(name, arguments: arguments);
    Navigator.of(ctx)
        .pushNamedAndRemoveUntil(name, (route) => false, arguments: arguments);
  }

  static Map<String, dynamic> getRouteArgs(BuildContext ctx) {
    return ModalRoute.of(ctx)?.settings.arguments as Map<String, dynamic>;
  }
}
