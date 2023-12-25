import 'package:flutter/material.dart';

import '../helpers/hive_helper.dart';

class MColors {





  // Color(0xff76974C);
  static Color colorPrimary =Color(int.parse(HiveHelper.getVendorApp()?.primaryColor??'0xFF6a0c80'));

  // Color(0xffE8F0DE);
  static  Color colorPrimaryLight = Color(int.parse(HiveHelper.getVendorApp()?.colorPrimaryLight??'0xffe7bcfa'));

  // Color(0xff76974C);
  static  Color colorPrimaryDark = Color(int.parse(HiveHelper.getVendorApp()?.colorPrimaryDark??'0xFF3b0042'));

  //Color(0xffb6aeae);
  static  Color colorSecondary = Color(int.parse(HiveHelper.getVendorApp()?.colorSecondary??'0xffb6aeae'));

  //Color(0xffe8e0e0);
  static  Color colorSecondaryLight = Color(int.parse(HiveHelper.getVendorApp()?.colorSecondaryLight??'0xffe8e0e0'));

  // Color(0xff867f7f);
  static  Color colorSecondaryDark = Color(int.parse(HiveHelper.getVendorApp()?.colorSecondaryDark??'0xff867f7f'));

  //0xfffafafa
  static const Color veryLightGray = Color(0xfffafafa);

  static const Color accentColor1 = Color(0xff0e1a34);
  static const darkColor = accentColor1;
  static const lightOrange = Color(0xFFFAA33C);

  static List<Color> gradientColors = [
    colorPrimary,
    colorPrimaryLight,
    colorPrimaryDark,
  ];
  static const MaterialColor colorPrimarySwatch = MaterialColor(
    0xff3797d2,
    {
      50: Color(0xff3797d2),
      100: Color(0xff3797d2),
      200: Color(0xff3797d2),
      300: Color(0xff3797d2),
      400: Color(0xff3797d2),
      500: Color(0xff3797d2),
      600: Color(0xff3797d2),
      700: Color(0xff3797d2),
      800: Color(0xff3797d2),
      900: Color(0xff3797d2),
    },
  );

  static const appInputColor = Color(0xffececec) ;

  static const blueColor = Colors.grey;

  static const blue2Color = Color.fromRGBO(28, 127, 187, 1);

  static const blue2GradColor = Color.fromRGBO(17, 175, 216, 1);

  static const skinColor = Color.fromRGBO(252, 226, 196, 1);

  static const blue3Color = Color.fromRGBO(102, 205, 170, 1);

  static const imageBg = Color.fromRGBO(250, 250, 250, 1);

  static const pendingColor = Color.fromRGBO(255, 248, 236, 1);
  static const cancelColor = Color.fromRGBO(255, 236, 236, 1.0);
  static const pendingTextColor = Color.fromRGBO(225, 162, 0, 1);


  static const deliveredColor = Color.fromRGBO(232, 240, 222, 1);
  static const deliveredTextColor = Color.fromRGBO(4, 177, 85, 1);

  static Color screensBackgroundColor = Colors.white.withOpacity(0.99);

  static const Color colorConfirmedStatues = Color(0xFF4044AA);

  static const Color colorProcessingDeliveredStatues = Color(0xFF40AA54);

  static const Color colorSideDetails = Color.fromRGBO(232, 240, 222, 1);

  static const Color colorSideDetailsStyle2 = Color.fromRGBO(118, 151, 76, 0.06);

  static const Color colorShippedStatues = Color(0xFF0066cc);

  static const Color colorCancelStatues = Color(0xFFFF2020);

  static const Color colorProcessingStatuesLine = Color(0xFFECECEC);

  static const Color profileTextColors = Color(0xFF6C7B8A);
}
