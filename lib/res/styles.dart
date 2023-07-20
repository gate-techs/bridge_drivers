import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'm_colors.dart';

class MStyles {
  static TextStyle textFormFieldTextStyle() {
    return const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: "Tajawal");
  }

  static OutlineInputBorder mOutlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: MColors.accentColor1, width: 1.0),
    borderRadius: BorderRadius.circular(10.0),
  );

  static const textStyle13 = TextStyle(
      color: MColors.colorPrimarySwatch,
      fontSize: 13,
      fontWeight: FontWeight.bold);
  static const textStyle16 = TextStyle(
      color: MColors.colorPrimary, fontSize: 16, fontWeight: FontWeight.bold);
  static const textStyle30 = TextStyle(
      color: MColors.colorPrimarySwatch,
      fontSize: 30,
      fontWeight: FontWeight.bold);

  static const textWhiteStyle14 = TextStyle(color: Colors.white, fontSize: 16);

  static const textGreyStyle14 =
      TextStyle(color: MColors.profileTextColors, fontSize: 16);

  static const textWhiteStyle22 = TextStyle(color: Colors.white, fontSize: 22);

  static const textGreyStyle22 = TextStyle(
      color: MColors.profileTextColors,
      fontSize: 22,
      fontWeight: FontWeight.bold);

  static const texBlackBold = TextStyle(fontWeight: FontWeight.bold);

  static const headlineStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.w500,
  );

  static const headlineColorPrimaryStyle = TextStyle(
    color: MColors.colorPrimary,
    fontSize: 24,
    fontFamily: 'Tajawal',
  );

  static const menuItemStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Tajawal',
  );

  static OutlineInputBorder border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );

  void showSnackBar(
      ScaffoldState scaffold, String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void changeStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
    );
  }

  void closeKeyboard(BuildContext context) => FocusScope.of(context).unfocus();

  void showKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());

//bool isEnglish = ui.window.locale.languageCode == "en";
  bool isEnglish = Platform.localeName.split('_')[0] == "en";

  static InputDecoration textFieldDecoration(String text, [String iconUrl = ""]) {
    return InputDecoration(
      hintText: text,
      suffixIcon: iconUrl.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                iconUrl,
                height: 20,
                width: 20,
              ),
            ),
      fillColor: MColors.sectionBg,
      filled: true,
      border: border,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(
          color: MColors.moveColor,
        ),
      ),
      enabledBorder: border,
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10)),
      disabledBorder: border,
    );
  }
}
