import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/res/m_colors.dart';


class LanguageDialog extends StatefulWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: 350,
        height: 300,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(30),
                    ),
                    color: MColors.greenColor,
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
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/background/bottom_right.png",
                width: 200,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 6),
                Image.asset(
                  "assets/images/language_image.png",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 6),
                Text(
                  "change_language".tr,
                  style: const TextStyle(
                    color: MColors.blueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 20,
                      color:MColors. blueColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        "choose_language".tr,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 20,
                      color: MColors.blueColor,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(MColors.greenColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          )
                      ),
                      onPressed: () async {
                        setState(() {
                          Get.updateLocale(const Locale('ar'));
                          HiveHelper.setLanguage('ar');
                          Get.back(result: {'refresh': true});
                        });
                      },
                      child: Text(
                        "arabic".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(MColors.greenColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          )
                      ),
                      onPressed: () async {
                        setState(() {
                          Get.updateLocale(const Locale('en'));
                          HiveHelper.setLanguage('en');
                          Get.back(result: {'refresh': true});
                        });
                      },
                      child: Text(
                        "english".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


