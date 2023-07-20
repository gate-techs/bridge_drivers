import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'bottom_sheet_item.dart';

class BottomNavigationMainMenu extends StatelessWidget {

  const BottomNavigationMainMenu({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 4))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomSheetItem(
            title: 'home'.tr,
            icon: 'ic_profile',
            color: /*cubit.currentIndex == 0
                ? MColors.colorPrimary
                : */const Color(0xff6c7b8a),
            tapCallBack: () {
              // cubit.changeBottomNavBar(0);
            },
          ),
          BottomSheetItem(
            title: 'location_history'.tr,
            icon: 'ic_location',
            color: /*cubit.currentIndex == 1
                ? MColors.colorPrimary
                : */const Color(0xff6c7b8a),
            tapCallBack: () {
              // cubit.changeBottomNavBar(1);
            },
          ),
        ],
      ),
    );
  }
}
