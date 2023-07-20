import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';
import 'package:kishk_driver/main.dart';

import 'send_fcm_repository.dart';

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
      Log.e('User granted permission');
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
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
            critical: true,
          );
    } else {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();
    }

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
              'kishk_channel_id',
              'kishk',
              channelDescription: 'general channel for notifications',
              importance: Importance.high,
              priority:
                  Platform.isIOS ? Priority.defaultPriority : Priority.high,
              playSound: true,
            ),
          ),
          payload: message.toMap().toString());
    }
  }

  static Future<String?> getToken() async {
    String? token = await firebaseMessaging.getToken();
    String? apnsToken = await firebaseMessaging.getAPNSToken();
    Log.i('FCM userToken $token , apnsToken $apnsToken');
    return token;
  }

  void registerNotification(BuildContext context) {
    mBuildContext = context;
    Log.i('-------------registerNotification----------');
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
      SendFcmRepository().sendFcmToken();
    });

    firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        showNotifications(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;

      Log.i(message.toMap().toString());
      showNotifications(message);
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      Log.i(message.toString());
      showNotifications(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      Log.i(message.toString());
      showNotifications(message);
    });
  }

  static void androidOnNotificationClicked(RemoteMessage message) {
    Log.i("${message.data}Notifi Data from bg");
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Log.i('onDidReceiveLocalNotification $id, $title, $body, $payload');
  }

  static void onAndroidInitMessage(BuildContext context) {
    firebaseMessaging.getInitialMessage().then((message) {});
  }
}
