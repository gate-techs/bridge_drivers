import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import '../features/auth/login/data/auth_login_entity.dart';
import '../features/auth/login/presentation/view/login_screen.dart';
import '../features/splash/data/vendor_entity.dart';

class HiveHelper {
  static ValueNotifier<Locale> mobileLanguage =
      ValueNotifier(Locale(getAppLanguage()));

  static const String boxKeyUserData = "boxKeyUserData";
  static const String boxKeyUserToken = "boxKeyUserToken";
  static const String boxKeyAppTheme = "boxKeyAppTheme";
  static const String keyBoxAppLanguage = "keyBoxAppLanguage";
  static const String keyAppOnBOARDING = "keyAppOnBOARDING";
  static const String keyIsDarkMode = 'keyIsDarkMode';
  static const String keyAppLogin = "keyAppLogin";
  static const String boxKeyVendorApp = "boxKeyVendorApp";


  static void setOnBoardingState(bool state) {
    Hive.box(keyAppOnBOARDING).put(keyAppOnBOARDING, state);
  }

  static bool getOnBoardingState() {
    return Hive.box(keyAppOnBOARDING).isNotEmpty
        ? Hive.box(keyAppOnBOARDING).get(keyAppOnBOARDING)
        : false;
  }

  static void setUserToken(String token) {
    Hive.box(boxKeyUserToken).put(boxKeyUserToken, token);
  }

  static String getUserToken() {
    return Hive.box(boxKeyUserToken).isNotEmpty
        ? Hive.box(boxKeyUserToken).get(boxKeyUserToken)
        : '';
  }

  static AuthDataData? getUserData() {
    return Hive.box(boxKeyUserData).isNotEmpty
        ? AuthDataData.fromJson(
            Hive.box(boxKeyUserData).get(boxKeyUserData),
          )
        : null;
  }


  static void setLoginState(bool state) {
    Hive.box(keyAppLogin).put(keyAppLogin, state);
  }


  static void clearUserData() {
    Hive.box(boxKeyUserToken).clear();
    Hive.box(boxKeyUserData).clear();
    Hive.box(boxKeyUserToken).clear();
    Get.offAll(() => const LoginScreen());
  }

  static void setModeState(bool state) {
    Hive.box(keyIsDarkMode).put(keyIsDarkMode, state);
  }

  static bool getModeState() {
    return Hive.box(keyIsDarkMode).isNotEmpty
        ? Hive.box(keyIsDarkMode).get(keyIsDarkMode)
        : false;
  }

  static void setLanguage(String languageCode) async {
    Hive.box(keyBoxAppLanguage).put(keyBoxAppLanguage, languageCode);
  }

  static String getAppLanguage() {
    return Hive.box(keyBoxAppLanguage).isNotEmpty
        ? Hive.box(keyBoxAppLanguage).get(keyBoxAppLanguage)
        : 'ar';
  }
  static bool getLoginState() {
    return Hive.box(keyAppLogin).isNotEmpty
        ? Hive.box(keyAppLogin).get(keyAppLogin)
        : false;
  }

  static void setUserData(AuthDataData authDataData) {
    Hive.box(HiveHelper.boxKeyUserData)
        .put(HiveHelper.boxKeyUserData, authDataData.toJson());
  }

  static VendorData? getVendorApp() {
    return Hive.box(boxKeyVendorApp).isNotEmpty
        ? VendorData.fromJson(
      Hive.box(boxKeyVendorApp).get(boxKeyVendorApp),
    )
        : null;
  }
}
