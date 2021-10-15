import 'package:flutter/material.dart';

class AppNavigationHelper {
  static navigateTo(context, {required String pageName}) {
    return Navigator.pushNamed(context, pageName);
  }

  static navigateAndReplace(context, {required String pageName}) {
    return Navigator.pushReplacementNamed(context, pageName);
  }

  static Future setRoot(context, Widget page) async {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
}
