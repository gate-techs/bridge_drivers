import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:kishk_driver/helpers/notifications_helper/send_fcm_repository.dart';
import 'package:path_provider/path_provider.dart';

import '../../common_utils/log_utils.dart';
import '../../main.dart';


class NotificationsHelper {
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static final flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static late NotificationAppLaunchDetails? notificationDetails;
  static late BuildContext? mBuildContext;

  void init() async {
    firebaseMessaging.setAutoInitEnabled(true);
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      Log.i('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      Log.e('User granted provisional permission');
    } else {
      Log.e('User declined or has not accepted permission');
    }
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings(
        '@mipmap/ic_launcher'); // @mipmap/ic_launcher @drawable/notification_logo
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      requestCriticalPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
      critical: true,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationTapBackground,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    notificationDetails =
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationDetails?.didNotificationLaunchApp == true) {
      var details = notificationDetails!.notificationResponse!;
      notificationTapBackground(details);
      Log.e('didNotificationLaunchApp ${details.payload}');
    }
  }

  static Future<bool> checkNotificationPermission() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  static Future<void> showNotifications(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      await flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'my_channel_id', //must be matches the channel in android manifest
              'appName',
              channelDescription: 'general channel for notifications',
              importance: Importance.high,
              priority:
              Platform.isIOS ? Priority.defaultPriority : Priority.high,
              playSound: true,
              largeIcon: FilePathAndroidBitmap(await downloadAndSaveFile(
                  notification.toMap()['image'] ?? '', 'largeIcon')),
            ),
          ),
          payload: message.toMap().toString());
    }
  }

  static Future<String> downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  static Future<String?> getToken() async {
    String? token = await firebaseMessaging.getToken();
    String? apnsToken = await firebaseMessaging.getAPNSToken();
    Log.i('FCM userToken $token , apnsToken $apnsToken');
    return token;
  }

  void registerNotification(BuildContext context) {
    mBuildContext = context;
    firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    firebaseMessaging.onTokenRefresh.listen((String token) {
      SendFcmRepository().updateFcmToken(token);
    });

    firebaseMessaging.getInitialMessage().then((message) {
      if (message?.data['invoice_id'] != null) {
        // Get.to(() => const NotificationsScreen());
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      //Do some stuff here
      showNotifications(message);
      if (message.data['invoice_id'] != null) {
        // Get.to(() => const NotificationsScreen());
      }
      Log.w('onMessage ${message.toMap().toString()}');
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      //Do some stuff here
      showNotifications(message);
      // if (message.data['invoice_id'] != null) {
      //   Get.to(() => const NotificationsScreen());
      // }
      Log.w('onBackgroundMessage ${message.toMap().toString()}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      //Do some stuff here
      showNotifications(message);
      // if (message.data['model_type'] == 'warnings') {
      //   if (message.data['id'] != null) {
      //     Get.to(() => const NotificationsScreen());
      // }else {
      //     if (message.data['id'] != null) {
      //       Get.to(() => const NotificationsScreen());
      //     }
      //   }}
    });
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Log.i('onDidReceiveLocalNotification $id, $title, $body, $payload');
  }
}
