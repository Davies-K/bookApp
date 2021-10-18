import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static TextTheme getTextTheme(context) {
    return Theme.of(context).textTheme;
  }

  static showSnackBar(GlobalKey<ScaffoldState> key, String text) {
    final SnackBar snackBar = SnackBar(
      content: Text(text),
    );
    key.currentState!.showSnackBar(snackBar);
  }

  static showToast({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }
}
