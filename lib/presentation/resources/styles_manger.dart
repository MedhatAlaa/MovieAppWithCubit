import 'package:flutter/material.dart';
import 'package:movies_app/presentation/resources/fonts_manger.dart';
import 'package:movies_app/presentation/resources/values_manger.dart';


TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color);
}

/// Light style
getLightStyle(
    {double fontSize = AppSize.s12,
    required Color color,
    required FontWeight fontWeight}) {
  return _getTextStyle(fontSize, FontWeightManger.light, color);
}

/// Regular style
getRegularStyle({double fontSize = AppSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.regular, color);
}

/// Medium style
getMediumStyle({double fontSize = AppSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.medium, color);
}

/// SemiBold style
getSemiBoldStyle({double fontSize = AppSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.semiBold, color);
}

/// Bold style
getBoldStyle({double fontSize = AppSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManger.bold, color);
}
