import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/common_utils/image_utils.dart';
import 'package:kishk_driver/res/m_colors.dart';

import '../../features/auth/profile/presentation/view/profile_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/search/presentation/search_screen.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/bottom_bar_screen';

  const BottomBarScreen({super.key});

  @override
  BottomBarScreenState createState() => BottomBarScreenState();
}

class BottomBarScreenState extends State<BottomBarScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPageIndex = 0;

  List<Widget> screens() => const [
        HomeScreen(),
        SearchScreen(),
        ProfileScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //for keyboard
      key: _scaffoldKey,
      body: Scaffold(
        body: Center(
          child: SizedBox.expand(
            child: screens()[_selectedPageIndex],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600,height: 1.6),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600,height: 1.6),
          onTap: (index) {
            setState(() => _selectedPageIndex = index);
          },
          // unselectedItemColor: Colors.grey,
          currentIndex: _selectedPageIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.svgHomeIcon,
                width: 24,
                height: 24,
              ),
              activeIcon: SvgPicture.asset(
                ImageUtils.svgHomeIconActive,
                width: 24,
                height: 24,
              ),
              label: "home_page".tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.svgSearchIcon,
                width: 24,
                height: 24,
              ),
              activeIcon: SvgPicture.asset(ImageUtils.svgSearchIcon,
                  width: 24,
                  height: 24,
                  colorFilter:
                      const ColorFilter.mode(MColors.colorPrimary, BlendMode.srcIn)),
              label: "search".tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageUtils.svgProfileIcon,
                width: 24,
                height: 24,
              ),
              activeIcon: SvgPicture.asset(
                ImageUtils.svgProfileIconActive,
                width: 24,
                height: 24,
              ),
              label: "profile_page".tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBarIcon(String iconUrl) {
    return Image.asset(
      iconUrl,
      fit: BoxFit.contain,
      height: 24,
      width: 24,
    );
  }
}
