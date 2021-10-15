import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:book_app/Utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

mixin BaseRepository {
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  Future<http.Response> post({required String url, dynamic data}) async {
    String encodedData = data == null ? "{}" : jsonEncode(data);
    debugPrint(url);
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: encodedData, headers: headers)
          .timeout(Duration(seconds: 60));
      return response;
    } catch (e) {
      if (e is SocketException)
        AppUtils.showToast(
            message: "Could not connect. Check your internet connection");
      if (e is TimeoutException)
        AppUtils.showToast(message: "Request TimeOut..");

      throw (e);
    }
  }

  Future<http.Response> get({required String url}) async {
    debugPrint(url);
    try {
      http.Response response = await http
          .post(Uri.parse(url), headers: headers)
          .timeout(Duration(seconds: 60));
      return response;
    } catch (e) {
      if (e is SocketException)
        AppUtils.showToast(
            message: "Could not connect. Check your internet connection");
      if (e is TimeoutException)
        AppUtils.showToast(message: "Request TimeOut..");

      throw (e);
    }
  }
}
