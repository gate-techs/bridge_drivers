import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/res/m_colors.dart';

import '../../common_utils/image_utils.dart';
import '../../features/notifications/persentation/notifications_screen.dart';

//optional parameters for cart and favorites screen to change the icons

class CustomAppBar extends StatelessWidget {
  final bool? cart;

  final bool? fav;

  final bool? profile;

  final bool? back;

  final int badgeCount;

  const CustomAppBar(
      {super.key,
      this.cart = false,
      this.fav = false,
      this.profile = false,
      this.back = false,
      required this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'home_page'.tr,
        style:  TextStyle(
            color: MColors.colorPrimary, fontFamily: 'Tajawal'),
      ),
      centerTitle: true,
      leading: (back!)
          ? IconButton(
              icon: Image.asset(
                'assets/icons/back_icon.png',
                width: 28,
                height: 28,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              })
          : IconButton(
              icon: Container(
                margin: const EdgeInsets.all(5),
                child: Badge(
                   label: Text(
                    badgeCount.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      height: 2,
                    ),
                  ),
                  largeSize: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SvgPicture.asset(
                    ImageUtils.svgNotificationsIcon,
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              onPressed: () {
                Get.to(() => const NotificationsScreen());
              },
            ),
      // actions: [
      //   IconButton(
      //     icon: fav!
      //         ? Image.asset(
      //             'assets/toolbar/active_fav_icon.png',
      //             width: 32,
      //             height: 32,
      //           )
      //         : Image.asset(
      //             'assets/toolbar/inactive_fav_icon.png',
      //             width: 32,
      //             height: 32,
      //           ),
      //     onPressed: () {
      //       if (!fav!) {
      //         // Navigator.of(context, rootNavigator: true).pushNamed(
      //         //   SessionManagement.isLoggedIn()
      //         //       ? FavoritesScreen.routeName
      //         //       : LoginScreen.routeName,
      //         // );
      //       }
      //     },
      //   ),
      //   IconButton(
      //     icon: Image.asset(
      //       'assets/toolbar/inactive_cart_icon.png',
      //       width: 28,
      //       height: 28,
      //     ),
      //     onPressed: () async {
      //       // if (!cart) {
      //       //    Navigator.of(context, rootNavigator: true).pushNamed(
      //       //     SessionManagement.isLoggedIn()
      //       //         ? CartScreen.routeName
      //       //         : LoginScreen.routeName,
      //       //   );
      //       // }
      //     },
      //   )
      // ],
    );
  }
}
