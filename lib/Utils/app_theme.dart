import 'dart:ui';

import 'package:flutter/material.dart';

class ColorsForApp{

  static Color appBackGround = const Color(0xFF070707);
  static Color blackLightColor = const Color(0xFF181818);
  static Color blackVeryLightColor = const Color(0xFF363636);
  static Color greenColor = const Color(0xFFA4C756);
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);

}

class StyleForApp{
  static const String fontName = 'WorkSans';
  static TextStyle  textStyle13NormalWhite = const TextStyle(fontSize: 13,color: Colors.white);
  static TextStyle  textStyle14NormalWhite = const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold);

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorsForApp.white,
  );


}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
