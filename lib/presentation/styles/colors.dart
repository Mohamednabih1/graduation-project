import 'package:flutter/material.dart';

class AppColors {
  static List<Color> backGroundGradientColors = [Colors.blue, Colors.green];
  static Decoration backGroundGradientColorsDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: backGroundGradientColors,
    ),
  );
}
