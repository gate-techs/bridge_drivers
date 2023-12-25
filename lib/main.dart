import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as get_x;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'country_code/controller/country_code_cubit.dart';
import 'di/injection.dart';
import 'features/splash/presentaion/cubit/splash_cubit.dart';
import 'features/splash/presentaion/splash_screen.dart';
import 'firebase_options.dart';
import 'helpers/hive_helper.dart';
import 'helpers/notifications_helper/notifications_helper.dart';
import 'language/app_language.dart';
import 'res/app_config.dart';
import 'res/bloc_observer/bloc_observer.dart';
import 'res/theme_controller.dart';

NotificationsHelper mNotificationSettings = NotificationsHelper();
String appFontFamily = 'Manrope';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Log.e('_firebaseMessagingBackgroundHandler ${message.toString()}');
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  dynamic data = jsonDecode(notificationResponse.payload!);

  Log.e('mRemoteMessage ${data.toString()}');

  RemoteMessage message =
  RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
  Log.e('mRemoteMessage ${message.data.toString()}');
}

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppConfig.setupRemoteConfig();

  Bloc.observer = MyBlocObserver();

  mNotificationSettings.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);



  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.keyBoxAppLanguage);
  await Hive.openBox(HiveHelper.keyIsDarkMode);
  await Hive.openBox(HiveHelper.keyAppOnBOARDING);
  await Hive.openBox(HiveHelper.keyAppLogin);
  await Hive.openBox(HiveHelper.boxKeyUserData).then((value) => null);
  await Hive.openBox(HiveHelper.boxKeyUserToken);
  await Hive.openBox(HiveHelper.boxKeyVendorApp).then((value) => null);


  await initAppDependencies();



  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  @override
  void initState() {
    mNotificationSettings.registerNotification(context);
    AppConfig.configLoading();
    appFontFamily =
    HiveHelper.getAppLanguage() == 'ar' ? 'NotoKufiArabic' : 'Manrope';
    permissions();
    super.initState();
  }

  void permissions() async {
    await [
      Permission.notification,
    ].request();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CountryCodeCubit()..getCountryCode(),
              ),
              BlocProvider(
                create: (context) => SplashCubit()..getVendorDetails(),
              ),
            ],
            child: get_x.GetMaterialApp(
              showPerformanceOverlay: false,
              debugShowCheckedModeBanner: false,
              title: 'appName'.tr,
              builder: EasyLoading.init(
                builder: (context, widget) =>
                    AppConfig.responsiveWrapperBuilder(context, widget),
              ),
              locale: Locale(HiveHelper.getAppLanguage()),
              translations: AppLanguage(),
              fallbackLocale: Locale(HiveHelper.getAppLanguage()),
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
              home: BlocBuilder<CountryCodeCubit, CountryCodeState>(
                builder: (context, state) {
                  return const SplashScreen();
                },
              ),
            ),
          );
        });
  }
}
