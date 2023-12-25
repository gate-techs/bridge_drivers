import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/features/auth/profile/presentation/view/profile_screen.dart';
import 'package:kishk_driver/features/search/presentation/search_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../common_utils/app_constants.dart';
import '../../../res/assets.dart';
import '../../../res/m_colors.dart';
import '../../../res/styles.dart';
import '../../home/presentation/screen/home_screen.dart';


part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  void updateIndex(int index) {
    currentIndex = index;
    emit(MainInitial());
  }
  void updateSliderIndex(int index) {
    currentIndex = index;
    emit(MainInitial());
  }
  List<Widget> buildScreens() {
    return [
      const HomeScreen(),
      const SearchScreen(),
      const ProfileScreen(),


    ];
  }


  List<Widget> btomAppBar() {
    return [
      const HomeScreen(),
      const SearchScreen(),
      const ProfileScreen(),

    ];
  }


  List<SalomonBottomBarItem> bridgeNavBarsItems() {
    return [
      /// Home
      SalomonBottomBarItem(
        icon: Icon(TablerIcons.layout_dashboard,color: MColors.colorPrimary,),
        activeIcon: Icon(TablerIcons.layout_dashboard,color: MColors.colorPrimary,),
        title: Text("dashboards".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),
      /// brands
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          Assets.svgBrandInActive,
          colorFilter: ColorFilter.mode(MColors.colorPrimary, BlendMode.srcIn),
          width: 24,
          height: 24,
        ),
        activeIcon: SvgPicture.asset(
    Assets.svgBrandInActive,
    colorFilter: ColorFilter.mode(MColors.colorPrimary, BlendMode.srcIn),
    width: 24,
    height: 24,
    ),
        title: Text("brands".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),
      /// Products
      SalomonBottomBarItem(
        icon: Icon(TablerIcons.rocket,color: MColors.colorPrimary,),
        activeIcon: Icon(TablerIcons.rocket,color: MColors.colorPrimary,),
        title: Text("products2".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),
      /// Offers
      SalomonBottomBarItem(
        icon: Icon(TablerIcons.discount_2,color: MColors.colorPrimary,),
        activeIcon: Icon(TablerIcons.discount_2,color: MColors.colorPrimary,),
        title: Text("offers".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),
      /// Profile
      SalomonBottomBarItem(
        icon: Icon(TablerIcons.shopping_bag,color: MColors.colorPrimary,),
        activeIcon: Icon(TablerIcons.shopping_bag,color: MColors.colorPrimary,),
        title: Text("myOrders".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),
    ];
  }

}


