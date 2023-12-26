import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import '../../../../../common_utils/image_utils.dart';
import '../../../../../helpers/hive_helper.dart';
import '../../../../../main.dart';
import '../../../../../res/gaps.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({
    Key? key,
    required this.callBack,
  }) : super(key: key);
  final Function() callBack;

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'chooseLanguage'.tr,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'SelectYourPreferredLanguage'.tr,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black54,
                  ))
            ],
          ),
          Gaps.vGap16,
          InkWell(
            onTap: () {
              setState(() {
                Get.updateLocale(const Locale('ar'));
                HiveHelper.setLanguage('ar');
                appFontFamily = 'NotoKufiArabic';
                widget.callBack.call();
                Get.back(result: {'refresh': true});
              });
            },
            child: Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      ImageUtils.svgKwait,
                      width: 40,
                      height: 40,
                      // colorFilter: ColorFilter.mode(MColors.colorPrimary, BlendMode.srcIn),
                    ),
                    Gaps.hGap16,
                    Text(
                      'العربية'.tr,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoKufiArabic'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Gaps.vGap16,
          InkWell(
            onTap: () {
              setState(() {
                Get.updateLocale(const Locale('en'));
                HiveHelper.setLanguage('en');
                appFontFamily = 'Manrope';
                widget.callBack.call();
                Get.back(result: {'refresh': true});
              });
            },
            child: Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      ImageUtils.svgUK,
                      width: 40,
                      height: 40,
                      // colorFilter: ColorFilter.mode(MColors.colorPrimary, BlendMode.srcIn),
                    ),
                    Gaps.hGap16,
                    Text(
                      'English'.tr,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
