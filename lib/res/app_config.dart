import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:kishk_driver/res/m_colors.dart';

import '../common_utils/app_constants.dart';
import '../common_utils/log_utils.dart';

class AppConfig {
  static Widget responsiveWrapperBuilder(context, widget) {
    return ResponsiveBreakpoints.builder(
      child: BouncingScrollWrapper.builder(context, widget!),
      // maxWidth: 1200,
      // minWidth: 480,
      // defaultScale: true,
      // defaultScaleFactor: 1.1,
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    );
  }

  static List<LocalizationsDelegate> localizationsDelegates = const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultMaterialLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate,
  ];

  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.dualRing
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.white
      ..indicatorColor = MColors.colorPrimary
      ..textColor = MColors.colorPrimary
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..maskType = EasyLoadingMaskType.black
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static Future<void> setupRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
    await remoteConfig.ensureInitialized();
    await remoteConfig.fetchAndActivate();
    await remoteConfig.fetch();
    await remoteConfig.activate();

    String remoteConfigBaseUrl = remoteConfig.getString("BaseUrlDrivers");
    String remoteConfigAppId = remoteConfig.getString("AppId");
    //Todo
    // if (remoteConfigBaseUrl.isNotEmpty) appCurrentBaseUrl = remoteConfigBaseUrl;
    if (remoteConfigAppId.isNotEmpty) appCurrentAppId = remoteConfigAppId;

    Log.e('remoteConfigBaseUrlDrivers=>$appCurrentBaseUrl remoteConfigAppId=>$appCurrentAppId ');
  }
}
