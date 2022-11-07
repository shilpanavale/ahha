import 'dart:ui';

import 'package:demo/Utils/asset_files.dart';
import 'package:flutter/material.dart';

class ColorsForApp{

  static Color appBackGround = const Color(0xFF070707);
  static Color blackLightColor = HexColor("#000000");
  static Color greenColor = HexColor("#96c73b");
  //static Color blackVeryLightColor = const Color(0xFF363636);
  static Color blackVeryLightColor =  HexColor("#1a1a1a");
  //static Color greenColor = const Color(0xFFA4C756);
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);

}

class StyleForApp{
  static const String fontName = 'Poppins';
  static TextStyle  textStyle13NormalWhite = const TextStyle(fontFamily:fontName,fontSize: 13,color: Colors.white);
  static TextStyle  textStyle14NormalWhite = const TextStyle(fontFamily:fontName,fontSize: 14,color: Colors.white);
  static TextStyle  textStyle12NormalGray = const TextStyle(fontFamily:fontName,fontSize: 12,color: Colors.grey);
  static TextStyle  textStyle13Gray = const TextStyle(fontFamily:fontName,fontSize: 13,color: Colors.grey);
  static TextStyle  textStyle14BoldWhite = const TextStyle(fontFamily:fontName,fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold);
  static TextStyle  textStyle14BoldGreen =  TextStyle(fontFamily:fontName,fontSize: 15,color: ColorsForApp.greenColor,fontWeight: FontWeight.bold);
  static TextStyle  textStyle20BoldGreen =  TextStyle(fontFamily:fontName,fontSize: 20,color: ColorsForApp.greenColor,fontWeight: FontWeight.w900);

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorsForApp.white,
  );
  static const TextStyle subHeadline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.27,
    color: ColorsForApp.white,
  );
  static const TextStyle extraSmaller12dp = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 12,
    letterSpacing: 0.27,
    color: ColorsForApp.white,
  );
  static  TextStyle headlineGreenColor = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: ColorsForApp.greenColor,
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

class AppLogo{
  static Widget appLogo =Container(
    height: 100,
    width: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.transparent,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          AssetsFiles.ahhaaLogo,
        ),
      ),
    ),
  );
  static Widget backLeadingButton =Container(
    alignment: Alignment.topLeft,
    height: 10,
    width: 140,

    child: const Icon(Icons.arrow_back,color: ColorsForApp.nearlyWhite,),
  );
}
