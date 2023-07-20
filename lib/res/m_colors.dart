import 'package:flutter/material.dart';

class MColors {
  static const moveColor = Color(0xFF6A1580);
  static const blueColor = Color(0xFF6A1580);
  static const greenColor = Color(0xFF6A1580);
  static const sectionBg = Color(0xFFf1f1f1);
  static const inputColor = Color(0xFFF0f7f8);
  static const appInputColor = Color(0xffececec) ;

  static const yellow = Color(0xFFFFE57F);

//static Bottom Bar gradient!
  static const firstColor = Color(0xFF6A1580);
  static const secondColor = Color(0xFF005d81);
  static const thirdColor = Color(0xFF3b0042);

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static const Color colorPrimary = Color(0xFF6A1580);
  static const Color colorPrimaryLight = Color(0xff73c8ff);
  static const Color colorPrimaryDark = Color(0xff0069a1);

  static const Color colorSecondary = Color(0xffb6aeae);
  static const Color colorSecondaryLight = Color(0xffe8e0e0);
  static const Color colorSecondaryDark = Color(0xff867f7f);

  static const Color accentColor1 = Color(0xfffaa115);
  static const darkColor = accentColor1;

  static List<Color> gradientColors = [
    colorPrimary,
    colorPrimaryLight,
    colorPrimaryDark,
  ];
  static const MaterialColor colorPrimarySwatch = MaterialColor(
    0xFF6A1580,
    {
      50: Color(0xFF6A1580),
      100: Color(0xFF6A1580),
      200: Color(0xFF6A1580),
      300: Color(0xFF6A1580),
      400: Color(0xFF6A1580),
      500: Color(0xFF6A1580),
      600: Color(0xFF6A1580),
      700: Color(0xFF6A1580),
      800: Color(0xFF6A1580),
      900: Color(0xFF6A1580),
    },
  );

  static const blue2Color = Color.fromRGBO(28, 127, 187, 1);

  static const blue2GradColor = Color.fromRGBO(17, 175, 216, 1);

  static const skinColor = Color.fromRGBO(252, 226, 196, 1);

  static const blue3Color = Color.fromRGBO(102, 205, 170, 1);

  static Color screensBackgroundColor = Colors.white.withOpacity(0.99);

  static const Color colorConfirmedStatues = Color(0xFF4044AA);

  static const Color colorProcessingDeliveredStatues = Color(0xFF40AA54);

  static const Color colorShippedStatues = Color(0xFF0066cc);

  static const Color colorCancelStatues = Color(0xFFFF2020);

  static const Color colorProcessingStatuesLine = Color(0xFFECECEC);

  static const Color profileTextColors = Color(0xFF6C7B8A);

  static const Color lightGrey = Color(0xffE5E5E5);

  static const Color darkGrey = Color(0xff1D2D3A);

  static const Color greyShape = Color(0xffF5F6F8);

  static const Color inputBGColor = Color(0xfffafafa);
}
