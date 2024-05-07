// ignore_for_file: prefer_const_constructors, unused_import, empty_catches

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradproject/app/di.dart';

class ToastManager {
  static void showTextToast(String text, {Color? backgroundColor}) {
    destroyToast();
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Color.fromARGB(255, 255, 255, 255),
      textColor: Color.fromARGB(255, 0, 0, 0),
      fontSize: 16.0,
    );
  }

  static void destroyToast() {
    try {
      Fluttertoast.cancel();
    } catch (e) {}
  }
}
