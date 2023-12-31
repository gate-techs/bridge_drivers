
import 'package:flutter/material.dart';

import '../main.dart';
import 'm_colors.dart';

class MStyles {
  static const textStyle13 = TextStyle(
      color: MColors.colorPrimarySwatch,
      fontSize: 13,
      fontWeight: FontWeight.bold);
  static  TextStyle textStyle16 =  TextStyle(
      color: MColors.colorPrimary, fontSize: 16, fontWeight: FontWeight.bold);
  static const textStyle30 = TextStyle(
      color: MColors.colorPrimarySwatch,
      fontSize: 30,
      fontWeight: FontWeight.bold);

  static const textWhiteStyle14 = TextStyle(color: Colors.white, fontSize: 16);

  static const textGreyStyle14 = TextStyle(color: MColors.profileTextColors, fontSize: 16);

  static const textWhiteStyle22 = TextStyle(color: Colors.white, fontSize: 22);

  static const textGreyStyle22 = TextStyle(
      color: MColors.profileTextColors,
      fontSize: 22,
      fontWeight: FontWeight.bold);

  static const texBlackBold = TextStyle(fontWeight: FontWeight.bold);

  static const headlineStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontFamily: 'Alexandria',
    fontWeight: FontWeight.w500,
  );

  static  TextStyle headlineColorPrimaryStyle =  TextStyle(
    color: MColors.colorPrimary,
    fontSize: 24,
    fontFamily: 'Alexandria',
  );

  static const menuItemStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Alexandria',
  );

  static TextStyle bottomNavStyle=  TextStyle(
    color: MColors.colorPrimary,
    fontSize: 13,
    fontFamily: appFontFamily,
  );


  static  textFieldStyle(String? hint, Widget? prefixIcon, Widget? suffixIcon) => InputDecoration(
    contentPadding: const EdgeInsets.all(12),
    fillColor: MColors.colorPrimary.withOpacity(0.1),
    focusColor: MColors.colorPrimary,
    hoverColor: MColors.colorPrimary,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    border: InputBorder.none,
    focusedBorder: OutlineInputBorder(
      borderSide:   BorderSide(
          color: MColors.colorPrimary,
          width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:  BorderSide(
          color: Colors.grey.withOpacity(0.3),
          width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    hintStyle:  TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontFamily: appFontFamily,
      fontWeight: FontWeight.w400,
    ),
    hintText: hint??'',
  );
}
