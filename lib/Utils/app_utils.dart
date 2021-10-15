import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static showSnackBar(GlobalKey<ScaffoldState> key, String text) {
    final SnackBar snackBar = SnackBar(
      content: Text(text),
    );
    key.currentState!.showSnackBar(snackBar);
  }

  static showToast({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
    );
  }
}
