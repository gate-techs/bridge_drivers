import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../country_code/data/country_code_entity.dart';
import '../features/order_details_screen/presentation/order_details_screen.dart';
import '../helpers/hive_helper.dart';
import 'image_utils.dart';

class CommonUtils {
  static Color getColorFromHex(String hexColor) {
    try {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "0xFF$hexColor";
      }
      return Color(int.parse(hexColor));
    } catch (e) {
      return Colors.transparent;
    }
  }

  static bool getISTablet(BuildContext context) {
    return (MediaQuery.sizeOf(context).width > 600);
  }

  static void showToastMessage(String? title,
      {String? message, String? status}) {
    CherryToast(
      icon: Icons.info_outline,
      themeColor: MColors.colorPrimary,
      title: Text(
        title ?? "",
        style:
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      displayTitle: false,
      description: Text(
        title ?? '',
        style: const TextStyle(color: Colors.black),
      ),
      toastPosition: Position.top,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(Get.context!);
// Get.snackbar(title ?? "", message ?? "",
    //     snackPosition: SnackPosition.TOP,
    //     backgroundColor:
    //         CommonUtils.getStatusTypeBGColorFromString(status ?? ""),
    //     padding: const EdgeInsets.only(
    //       left: 6,
    //       right: 3,
    //       top: 3,
    //     ),
    //     icon: CommonUtils.getStatusTypeIconFromString(status ?? ""),
    //     borderRadius: 20,
    //     borderWidth: 1,
    //     borderColor: CommonUtils.getStatusTypeColorFromString(status ?? ""),
    //     margin: const EdgeInsets.all(15),
    //     colorText: Colors.black,
    //     titleText: Text(
    //       title ?? "",
    //       style:
    //           const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
    //     ),
    //     duration: const Duration(seconds: 2),
    //     isDismissible: true,
    //     forwardAnimationCurve: Curves.elasticInOut,
    //     boxShadows: [
    //       const BoxShadow(
    //         color: Colors.black12,
    //         offset: Offset(0, 4),
    //         blurRadius: 8,
    //         spreadRadius: 0,
    //       )
    //     ]);
    // Get.closeCurrentSnackbar();
  }
  static gotToDestination(String modelType, String modelId,
      {bool? fromOnBoarding = false}) {
    if (modelType.isNotEmpty && modelId.isNotEmpty) {
      switch (modelType) {

        case 'orders':
          Get.offAll(OrderDetailsScreen(
            id: modelId,
          ));

          break;
        default:
          Get.offAll(OrderDetailsScreen(
            id: modelId,
          ));
          break;
      }
    }
  }

  static Widget getStatusTypeIconFromString(String status) {
    switch (status) {
      case 'pending':
      case 'in_progress':
      case 'warning':
      case 'Late':
      case 'draft':
        return SvgPicture.asset(
          ImageUtils.getAssetsPath('ic_warning', 'svg', format: 'svg'),
          height: 4,
          width: 4,
        );
      case 'accepted':
      case 'Present':
      case 'finished':
      case 'success':
        return SvgPicture.asset(
          ImageUtils.getAssetsPath('ic_success', 'svg', format: 'svg'),
          height: 4,
          width: 4,
        );
      case 'rejected':
      case 'refused':
      case 'canceled':
      case 'error':
        return SvgPicture.asset(
          ImageUtils.getAssetsPath('ic_warning', 'svg', format: 'svg'),
          height: 4,
          width: 4,
        );
      default:
        return Image.asset(
          ImageUtils.getAssetsPath('logo', 'images', format: 'png'),
          height: 4,
          width: 4,
        );
    }
  }

  static Color getStatusTypeBGColorFromString(String status) {
    switch (status) {
      case 'pending':
      case 'in_progress':
      case 'Late':
      case 'draft':
      case 'warning':
        return MColors.colorPrimary;
      case 'accepted':
      case 'Present':
      case 'finished':
      case 'success':
      case 'start':
        return MColors.colorPrimary;
      case 'rejected':
      case 'refused':
      case 'canceled':
      case 'cut':
      case 'cancelled':
      case 'error':
        return MColors.colorPrimary;
      default:
        return MColors.colorPrimary;
    }
  }

  static Color getStatusTypeColorFromString(String status) {
    switch (status) {
      case 'pending':
      case 'in_progress':
      case 'Late':
      case 'draft':
      case 'warning':
        return const Color(0xffFFAA00);
      case 'accepted':
      case 'Present':
      case 'finished':
      case 'success':
      case 'start':
        return const Color(0xff2EC275);
      case 'rejected':
      case 'refused':
      case 'canceled':
      case 'cancelled':
      case 'error':
        return const Color(0xffF46F34);
      default:
        return MColors.colorPrimary;
    }
  }

  static Color getStatusTypeColorFromCode(int status) {
    switch (status) {
      case 77:
        return const Color(0xfffbc02d);
      case 66:
        return const Color(0xff00A843);
      case 67:
        return const Color(0xffd32f2f);
      default:
        return MColors.colorPrimary;
    }
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


  // static void showLoadingDialog() {
  //   showGeneralDialog(
  //     context: Get.context!,
  //     barrierLabel: "Barrier",
  //     barrierDismissible: false,
  //     useRootNavigator: false,
  //     barrierColor: Colors.white.withOpacity(0.4),
  //     transitionDuration: const Duration(milliseconds: 200),
  //     pageBuilder: (_, __, ___) {
  //       isLoadingDialogVisible = true;
  //       return const SizedBox();
  //     },
  //     transitionBuilder: (_, anim, __, child) {
  //       Tween<Offset> tween;
  //       if (anim.status == AnimationStatus.reverse) {
  //         tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
  //       } else {
  //         tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
  //       }
  //       return SlideTransition(
  //         position: tween.animate(anim),
  //         child: FadeTransition(
  //           opacity: anim,
  //           child: child,
  //         ),
  //       );
  //     },
  //   );
  // }
  //
  // static void closeLoadingDialog() {
  //   if (isLoadingDialogVisible) {
  //     isLoadingDialogVisible = false;
  //     ModalRoute<Object?>? route = ModalRoute.of(Get.context!);
  //     if (route != null) {
  //       Log.w(route.settings.name.toString());
  //     }
  //     Navigator.pop(Get.context!);
  //   }
  // }

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

  // static Future<String?> getDeviceId() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     Log.d('Device id ${androidInfo.device}');
  //     return androidInfo.androidId;
  //   }
  //   if (Platform.isIOS) {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     Log.d('Device id ${iosInfo.identifierForVendor}');
  //     return iosInfo.identifierForVendor;
  //   }
  //   return null;
  // }

  // static String durationToString(int minutes) {
  //   var d = Duration(minutes: minutes);
  //   List<String> parts = d.toString().split(':');
  //   return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  // }
  //
  // static Color getStatusTypeColorFromCode(int status) {
  //   switch (status) {
  //     case 77:
  //       return const Color(0xffffaa00);
  //     case 66:
  //       return const Color(0xff00c950);
  //     case 67:
  //       return const Color(0xffff3434);
  //     default:
  //       return const Color(0xffff3434);
  //   }
  // }

  // static String getNotificationItemIcon(String type) {
  //   switch (type) {
  //     case 'hr-leave-permission':
  //       return 'ic_permission';
  //     case 'hr-vacation':
  //       return 'ic_vacations';
  //
  //     default:
  //       return 'logo';
  //   }
  // }

  static Future<void> launchInWebViewWithoutJavaScript(String url,
      {LaunchMode? mode}) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: mode ?? LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> emailTo(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
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




  // static Future<void> writeToFile(ByteData data, String path) async {
  //   final buffer = data.buffer;
  //   await File(path).writeAsBytes(
  //       buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  // }

  // static Future<File> saveFileToStorage(ByteData data, String name) async {
  //   var status = await Permission.storage.status;
  //
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //   }
  //
  //   String? tempDir = await getStoragePath();
  //   String tempPath = tempDir!;
  //
  //   String filePath = '$tempPath/$name';
  //   ByteData bytes = ByteData.view(data.buffer);
  //   ByteBuffer buffer = bytes.buffer;
  //
  //   return File(filePath).writeAsBytes(
  //       buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  // }

  // static Future<String?> getStoragePath() async {
  //   Directory? directory;
  //   try {
  //     if (Platform.isIOS) {
  //       directory = await getApplicationDocumentsDirectory();
  //     } else {
  //       directory = Directory('/storage/emulated/0/Download');
  //       if (!await directory.exists()) {
  //         directory = await getExternalStorageDirectory();
  //       }
  //     }
  //   } catch (err, stack) {
  //     Log.e("$err $stack");
  //   }
  //   return directory?.path;
  // }



  // static gotToDestination(String modelType, String modelId,
  //     {bool? fromOnBoarding = false}) {
  //   if (modelType.isNotEmpty && modelId.isNotEmpty) {
  //     switch (modelType) {
  //       case 'offers':
  //         fromOnBoarding!
  //             ? Get.offAll(const ProductsScreen())
  //             : Get.to(const ProductsScreen());
  //         break;
  //       case 'products':
  //         fromOnBoarding!
  //             ? Get.offAll(ProductDetailsScreen(
  //           id: modelId,
  //           fromOnBoarding: fromOnBoarding,
  //         ))
  //             : Get.to(ProductDetailsScreen(
  //           id: modelId,
  //           fromOnBoarding: fromOnBoarding,
  //         ));
  //
  //         break;
  //       case 'Products':
  //         fromOnBoarding!
  //             ? Get.offAll(ProductDetailsScreen(
  //           id: modelId,
  //           fromOnBoarding: fromOnBoarding,
  //         ))
  //             : Get.to(ProductDetailsScreen(
  //           id: modelId,
  //           fromOnBoarding: fromOnBoarding,
  //         ));
  //         break;
  //       case 'brands':
  //         fromOnBoarding!
  //             ? Get.offAll(const ProductsScreen())
  //             : Get.to(const ProductsScreen());
  //
  //         break;
  //       case 'Brands':
  //         fromOnBoarding!
  //             ? Get.offAll(const ProductsScreen(
  //         ))
  //             : Get.to(const ProductsScreen());
  //         break;
  //       case 'orders':
  //         fromOnBoarding!
  //             ? Get.offAll(OrderDetailsScreen(
  //           id: modelId,
  //         ))
  //             : Get.to(OrderDetailsScreen(
  //           id: modelId,
  //         ));
  //
  //         break;
  //       default:
  //         fromOnBoarding!
  //             ? Get.offAll(ProductDetailsScreen(
  //           id: modelId,
  //           fromOnBoarding: fromOnBoarding,
  //         ))
  //             : Get.to(ProductDetailsScreen(
  //           id: modelId,
  //           fromOnBoarding: fromOnBoarding,
  //         ));
  //         break;
  //     }
  //   }
  // }
  static List<CountryCodeDataRows>? countryCodeList;
// static void onMapCreated(
//     GoogleMapController controller,
//     GoogleMapController controllerView,
//     Completer<GoogleMapController> completer) async {
//   rootBundle.loadString("assets/json/map_style.json").then((value) {
//     controller.setMapStyle(value);
//   });
//
//   completer.complete(controller);
//
//   Future.delayed(const Duration(seconds: 1), () async {
//     controllerView = await completer.future;
//     controllerView.animateCamera(
//       CameraUpdate.newCameraPosition(
//         const CameraPosition(
//           target: LatLng(21.543333, 39.172779),
//           zoom: 4.0,
//         ),
//       ),
//     );
//   });
// }
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
  // OrdersStatus.news,
  // OrdersStatus.pending,
  OrdersStatus.shipping,
  OrdersStatus.completed,
  OrdersStatus.rejected,

];
