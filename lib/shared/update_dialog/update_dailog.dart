import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/res/gaps.dart';

import '../../main.dart';
import '../../res/m_colors.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    super.key,
    this.onTap,
  });
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 100,
          width: 100,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'newerVersion'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'updateVersionMessage'.tr,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        Gaps.vGap20,
        InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!.call();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MColors.colorPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Text(
                'update'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),

        Gaps.vGap20
      ],
    );
  }
}