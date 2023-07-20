import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kishk_driver/common_utils/image_utils.dart';
import 'package:kishk_driver/res/gaps.dart';

import '../../../../helpers/hive_helper.dart';
import '../../../../res/m_colors.dart';
import 'drawer_item.dart';
import 'drawer_sub_menu_lang_item.dart';
import 'drawer_submenu_item.dart';

class DrawerLayout extends StatefulWidget {
  const DrawerLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerLayout> createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(24), topEnd: Radius.circular(24)),
      child: Drawer(
          backgroundColor: Colors.white.withOpacity(1),
          child: ListView(
            children: [
              Gaps.vGap10,
              ExpansionTile(
                trailing: SvgPicture.asset(
                  ImageUtils.getSVGPath('ic_arrow_down'),
                  width: 24,
                  height: 24,
                ),
                title: Container(
                  margin: const EdgeInsetsDirectional.only(
                    start: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: MColors.colorPrimary.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                          ImageUtils.getSVGPath(
                              'ic_drawer_administrative_requests'),
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Gaps.hGap8,
                      Text(
                        'AboutTheMinistry'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: const [],
              ),
              Gaps.vGap10,
              ExpansionTile(
                trailing: SvgPicture.asset(
                  ImageUtils.getSVGPath('ic_arrow_down'),
                  width: 24,
                  height: 24,
                ),
                title: Container(
                  margin: const EdgeInsetsDirectional.only(
                    start: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: MColors.colorPrimary.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                          ImageUtils.getSVGPath(
                              'ic_drawer_administrative_requests'),
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Gaps.hGap8,
                      Text(
                        'MediaMaterials'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // DrawerSubMenuItem(name: S.current.contractRequest,callback: (){}),
                ],
              ),
              Gaps.vGap10,
              ExpansionTile(
                trailing: SvgPicture.asset(
                  ImageUtils.getSVGPath('ic_arrow_down'),
                  width: 24,
                  height: 24,
                ),
                title: Container(
                  margin: const EdgeInsetsDirectional.only(
                    start: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: MColors.colorPrimary.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                          ImageUtils.getSVGPath(
                              'ic_drawer_administrative_requests'),
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Gaps.hGap8,
                      Text(
                        'OurServices'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // DrawerSubMenuItem(name: S.current.contractRequest,callback: (){}),
                ],
              ),
              Gaps.vGap10,
              ExpansionTile(
                trailing: SvgPicture.asset(
                  ImageUtils.getSVGPath('ic_arrow_down'),
                  width: 24,
                  height: 24,
                ),
                title: Container(
                  margin: const EdgeInsetsDirectional.only(
                    start: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: MColors.colorPrimary.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                          ImageUtils.getSVGPath(
                              'ic_drawer_administrative_requests'),
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Gaps.hGap8,
                      Text(
                        'ConnectWithUs'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DrawerSubMenuItem(name: S.current.contractRequest,callback: (){}),
                  DrawerSubMenuItem(name: 'ContactUsForm'.tr, callback: () {}),
                  const Divider(
                    color: Colors.grey,
                  ),
                  DrawerSubMenuItem(
                      name: 'MinistryPhoneNumbers'.tr, callback: () {}),
                  const Divider(
                    color: Colors.grey,
                  ),
                  DrawerSubMenuItem(
                      name: 'MinistryWebsite'.tr, callback: () {}),
                  const Divider(
                    color: Colors.grey,
                  ),
                  DrawerSubMenuItem(
                      name:
                          'ContactTheOfficeOfHisExcellencyTheMinisterOfInformation'
                              .tr,
                      callback: () {}),
                  DrawerSubMenuItem(
                      name: 'WhatsAppReportingADeath'.tr, callback: () {}),
                ],
              ),
              Gaps.vGap10,
              ExpansionTile(
                trailing: SvgPicture.asset(
                  ImageUtils.getSVGPath('ic_arrow_down'),
                  width: 24,
                  height: 24,
                ),
                title: Container(
                  margin: const EdgeInsetsDirectional.only(
                    start: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: MColors.colorPrimary.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                          ImageUtils.getSVGPath('ic_language'),
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Gaps.hGap8,
                      Text(
                        'lang'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  // DrawerSubMenuItem(name: S.current.contractRequest,callback: (){}),
                  DrawerSubMenuLanguageItem(
                    name: 'ar'.tr,
                    isChecked: HiveHelper.getAppLanguage() == 'ar',
                    callback: () async {
                      if (HiveHelper.mobileLanguage.value !=
                          const Locale('ar')) {
                        HiveHelper.mobileLanguage.value = const Locale('ar');
                      }
                      await Hive.box(HiveHelper.keyBoxAppLanguage)
                          .put(HiveHelper.keyBoxAppLanguage, 'ar');
                      Get.updateLocale(const Locale('ar'));
                    },
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  DrawerSubMenuLanguageItem(
                    name: 'en'.tr,
                    isChecked: HiveHelper.getAppLanguage() == 'en',
                    callback: () async {
                      if (HiveHelper.mobileLanguage.value !=
                          const Locale('en')) {
                        HiveHelper.mobileLanguage.value = const Locale('en');
                      }
                      await Hive.box(HiveHelper.keyBoxAppLanguage)
                          .put(HiveHelper.keyBoxAppLanguage, 'en');
                      Get.updateLocale(const Locale('en'));
                    },
                  ),
                ],
              ),
              Gaps.vGap10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: DrawerItem(
                  name: 'logout'.tr,
                  icon: HiveHelper.getAppLanguage() == "en"
                      ? 'ic_logout_en'
                      : 'ic_logout',
                  callback: () {
                    HiveHelper.clearUserData();
                  },
                ),
              ),
            ],
          )),
    );
  }
}
