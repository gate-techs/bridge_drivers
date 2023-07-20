import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/hive_helper.dart';

class CommonUtils {
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "0xFF$hexColor";
    }
    return Color(int.parse(hexColor));
  }

  static void showToastMessage(String? title,
      {String? message, String? status}) {
    Get.snackbar(title ?? "", message ?? "",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        borderRadius: 20,
        animationDuration: const Duration(seconds: 1),
        borderWidth: 1,
        margin: const EdgeInsets.all(15),
        colorText: Colors.black,
        titleText: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            title ?? "",
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'Tajawal',
                color: Colors.black),
          ),
        ),
        duration: const Duration(milliseconds: 2500),
        isDismissible: true,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        boxShadows: [
          const BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
          )
        ]);
    // Get.closeCurrentSnackbar();
  }

  static bool isLoadingDialogVisible = false;

  static void showDialog(Widget dialogWidget) {
    showGeneralDialog(
      context: Get.context!,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return dialogWidget;
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static void toggleAppLanguage(AppLanguages language) async {
    if (HiveHelper.mobileLanguage.value == Locale(language.name)) {
      return;
    } else {
      HiveHelper.mobileLanguage.value = Locale(language.name);
      HiveHelper.setLanguage(language.name);
      Get.updateLocale(Locale(language.name));
    }
  }

  static AppLanguages getLanguageName(String language) {
    switch (language) {
      case 'ar':
        return AppLanguages.ar;
      case 'en':
        return AppLanguages.en;

      default:
        return AppLanguages.ar;
    }
  }

  static Future<void> requestPermissions() async {
    await [
      // Permission.notification,
      Permission.location,
      Permission.locationWhenInUse,
    ].request();
  }

  static Color getStatusColorFromId(String id) {
    switch (id) {
      case '0':
        return MColors.colorConfirmedStatues;
      case '1':
        return MColors.colorShippedStatues;
      case '2':
        return MColors.colorProcessingDeliveredStatues;
      case '3':
        return MColors.darkGrey;
      case '4':
        return MColors.greenColor;

      default:
        return MColors.colorConfirmedStatues;
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> whatsappMessage(
    String phone,
    String message,
  ) async {
    final Uri launchUri = Uri.parse(Platform.isIOS
        ? "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}"
        : "whatsapp://send?phone=$phone&text=${Uri.parse(message)}");
    await launchUrl(launchUri);
  }
}

enum FileSources {
  camera,
  gallery,
  file,
}

enum AppLanguages { ar, en }

enum OrdersStatus {
  news("0"),
  pending("1"),
  rejected("2"),
  shipping("3"),
  completed("4"),
  all("-1");

  const OrdersStatus(this.value);

  final String value;
}

List<OrdersStatus> mOrdersStatusList = [
  OrdersStatus.news,
  OrdersStatus.pending,
  OrdersStatus.shipping,
  OrdersStatus.completed,
  OrdersStatus.rejected,

];
