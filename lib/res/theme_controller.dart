import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';

import 'm_colors.dart';

class ThemeController extends GetxController {
  late bool _isDarkMode;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeController() {
    _isDarkMode = HiveHelper.getModeState();

    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: MColors.darkColor,
          statusBarIconBrightness: Brightness.light));
    } else {
      SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
          statusBarColor: MColors.colorPrimary,
          statusBarIconBrightness: Brightness.dark));
    }
  }

  TextTheme get _textTheme {
    return GoogleFonts.tajawalTextTheme();
  }

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: MColors.screensBackgroundColor,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ),
      primaryColor: MColors.colorPrimary,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: MColors.screensBackgroundColor,
        ),
        titleTextStyle: const TextStyle(fontSize: 23),
      ),
      textTheme: _textTheme.apply(
        fontFamily: _textTheme.bodyLarge!.fontFamily,
      ),
      primaryColorLight: MColors.screensBackgroundColor,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MColors.darkColor,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return MColors.colorPrimary;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return MColors.colorPrimary;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return MColors.colorPrimary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return MColors.colorPrimary;
          }
          return null;
        }),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
      primaryColor: MColors.colorPrimary,
      brightness: Brightness.dark,
      drawerTheme: const DrawerThemeData(
        backgroundColor: MColors.darkColor,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: MColors.darkColor),
        backgroundColor: MColors.darkColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(fontSize: 23),
      ),
      textTheme: _textTheme
          .merge(
            ThemeData.dark().textTheme,
          )
          .apply(
            fontFamily: _textTheme.bodyLarge!.fontFamily,
          )
          .apply(
            fontFamily: _textTheme.bodyLarge!.fontFamily,
          )
          .apply(
            fontFamily: _textTheme.labelSmall!.fontFamily,
          ),
      scaffoldBackgroundColor: MColors.darkColor,
      primaryColorDark: MColors.darkColor,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: MColors.darkColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(MColors.colorPrimary),
        trackColor: MaterialStateProperty.all(
          MColors.colorPrimary.withOpacity(0.6),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return MColors.colorPrimary;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return MColors.colorPrimary;
          }
          return null;
        }),
      ),
    );
  }

  void toggle() {
    var x = Get.isDarkMode;

    Get.changeTheme(
      x ? lightTheme : darkTheme,
    );

    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);

    if (!x) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: MColors.darkColor,
          statusBarIconBrightness: Brightness.light));
    } else {
      SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
          statusBarColor: MColors.colorPrimary,
          statusBarIconBrightness: Brightness.dark));
    }

    x ? HiveHelper.setModeState(false) : HiveHelper.setModeState(true);
  }
}
