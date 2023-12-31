import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../main.dart';

class NoNotificationsYet extends StatelessWidget {
  const NoNotificationsYet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/no_notifcations.json'),
              Text(
                "noNotificationsYet".tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: appFontFamily,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // Gaps.vGap10,
              // Text(
              //   "noNotificationsYetDetails".tr,
              //   textAlign: TextAlign.left,
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 14,
              //     fontFamily: appFontFamily,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
