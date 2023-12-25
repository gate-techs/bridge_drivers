import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart' as get_x;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';
import 'package:kishk_driver/features/splash/splach_screen.dart';
import 'package:kishk_driver/helpers/notifications_helper/notification_helper.dart';
import 'di/injection.dart';
import 'helpers/hive_helper.dart';
import 'helpers/notifications_helper/firebase_options.dart';
import 'language/app_language.dart';
import 'res/app_config.dart';
import 'res/bloc_observer/bloc_observer.dart';
import 'res/theme_controller.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Log.e('_firebaseMessagingBackgroundHandler ${message.toString()}');
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  if (Platform.isAndroid) {
    dynamic data = jsonDecode(notificationResponse.payload!);

    Log.e('mRemoteMessage ${data.toString()}');

    RemoteMessage message =
        RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
    Log.e('mRemoteMessage ${message.data.toString()}');

    NotificationsHelper.showNotifications(message);

    NotificationsHelper.androidOnNotificationClicked(message);
  }
}

NotificationsHelper mNotificationSettings = NotificationsHelper();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppConfig.setupRemoteConfig();

  mNotificationSettings.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  initAppDependencies();

  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.keyBoxAppLanguage);
  await Hive.openBox(HiveHelper.keyIsDarkMode);
  await Hive.openBox(HiveHelper.keyAppOnBOARDING);
  await Hive.openBox(HiveHelper.boxKeyUserData);
  await Hive.openBox(HiveHelper.boxKeyUserToken);
  await Hive.openBox(HiveHelper.keyAppLogin);

  AppConfig.configLoading();

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {

    mNotificationSettings.registerNotification(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return get_x.GetMaterialApp(
      // onInit: () => NotificationsHelper.mBuildContext ??= context,
      debugShowCheckedModeBanner: false,
      title: 'appTitle'.tr,
      builder: EasyLoading.init(
        builder: (context, widget) =>
            AppConfig.responsiveWrapperBuilder(context, widget),
      ),
      locale: HiveHelper.mobileLanguage.value,
      fallbackLocale: HiveHelper.mobileLanguage.value,
      translations: AppLanguage(),
      supportedLocales: const <Locale>[
        Locale.fromSubtags(languageCode: 'en'),
        Locale.fromSubtags(languageCode: 'ar'),
      ],
      localizationsDelegates: AppConfig.localizationsDelegates,
      defaultTransition: get_x.Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
      themeMode: ThemeController().themeMode,
      theme: ThemeController().lightTheme,
      darkTheme: ThemeController().darkTheme,
      // home: const MainScreen(),
      home: const SplashScreen(),
    );
  }
}
