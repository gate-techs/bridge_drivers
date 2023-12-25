import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';
import 'package:kishk_driver/res/m_colors.dart';

import 'gradiant_button.dart';
class ErrorDialog extends StatelessWidget {
  final String errorMessage;
  const ErrorDialog({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: 350,
        height: 300,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () => Get.back(result: {'refresh': true}),
                child: Container(
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(30),
                    ),
                    color: MColors.colorPrimary,
                  ),
                  width: 60,
                  height: 50,
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Icon(
                    Iconsax.close_circle,
                    color: Colors.red,
                    size: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "warning".tr,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontFamily: 'Tajawal'),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                          color: Colors.grey, fontFamily: 'Tajawal'),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: SizedBox(
                        child: gradientButton('ok'.tr, context, () {
                          try {
                            Get.back(result: {'refresh': true});
                          } catch (e) {
                            Log.e(e.toString());
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

