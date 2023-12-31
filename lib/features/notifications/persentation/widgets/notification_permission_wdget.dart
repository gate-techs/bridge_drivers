
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../helpers/notifications_helper/notifications_helper.dart';
import '../../../../main.dart';

import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';

class NotificationsPermissionWidget extends StatefulWidget {
  const NotificationsPermissionWidget({Key? key, required this.callBack})
      : super(key: key);
  final Function(bool) callBack;

  @override
  State<NotificationsPermissionWidget> createState() =>
      _NotificationsPermissionWidgetState();
}

class _NotificationsPermissionWidgetState
    extends State<NotificationsPermissionWidget> {
  @override
  void initState() {
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/no_notifcations.json'),
            Text(
              "NOTIFICATIONSARENOTENABLED".tr,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.vGap10,
            Text(
              "pleaseEnableNotifications".tr,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.vGap16,
            InkWell(
              onTap: () async {
                if (!await NotificationsHelper.checkNotificationPermission()) {
                  widget.callBack(await openAppSettings());
                }
              },
              child: Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: MColors.colorPrimary,
                      width: 2,
                    )),
                child: Center(
                  child: Text(
                    'enableNotifications'.tr,
                    style: TextStyle(
                      color: MColors.colorPrimary,
                      fontSize: 16,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
