import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/common/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    // fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSizeConstants.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontWeightConstants.regular,
    color,
  );
}

// medium style
TextStyle getMediumStyle({
  double fontSize = FontSizeConstants.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightConstants.medium,
    color,
  );
}

// medium style
TextStyle getLightStyle({
  double fontSize = FontSizeConstants.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightConstants.light,
    color,
  );
}

// bold style
TextStyle getBoldStyle({
  double fontSize = FontSizeConstants.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightConstants.bold,
    color,
  );
}

// semibold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSizeConstants.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightConstants.semiBold,
    color,
  );
}
