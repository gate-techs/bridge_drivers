import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../common_utils/app_constants.dart';
import '../../../res/m_colors.dart';
import '../../../res/styles.dart';
import '../../main_screens/drivers/presentation/drivers_screen.dart';
import '../../main_screens/home/presentation/screen/home_screen.dart';
import '../../main_screens/profile/presentation/profile_screen.dart';
import '../../orders/presentation/orders_search_screen.dart';
import '../../orders/presentation/search_bloc/search_bloc.dart';
import '../domain/notifications_badge_count_repository.dart';


part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(BuildContext context) => BlocProvider.of(context);



  String countNotifications = '0';


  void getCount() async {
    getNotificationsCount();
  }

  NotificationBadgeCountRepository notificationBadgeCountRepository = NotificationBadgeCountRepository();


  void getNotificationsCount() async {
    final resul =
    await notificationBadgeCountRepository.getNotificationBadgeCount();
    resul.fold((l) {
      countNotifications = '0';
    }, (r) {
      if (r.data == null) {
        countNotifications = '0';
      } else {
        countNotifications = r.data?.badgeCount?.toString() ?? '0';
      }
      emit(MainInitial());
    });
  }




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
      BlocProvider(
        create: (context) =>OrdersSearchBloc(),
        child:       const OrdersSearchScreen(),),

      if(HiveHelper.getUserData()?.userData?.role=='driversAdmin')
      const DriversScreen(),
      const ProfileScreen(),


    ];
  }



  List<SalomonBottomBarItem> bridgeNavBarsItems() {
    return [
      /// Home
      SalomonBottomBarItem(
        icon: Icon(TablerIcons.layout_dashboard,color: MColors.colorPrimary,),
        activeIcon: Icon(TablerIcons.layout_dashboard,color: MColors.colorPrimary,),
        title: Text("home".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),

      /// search
      SalomonBottomBarItem(
        icon: Icon(TablerIcons.search,color: MColors.colorPrimary,),
        activeIcon: Icon(TablerIcons.search,color: MColors.colorPrimary,),
        title: Text("search".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),
      /// drivers
     if(HiveHelper.getUserData()?.userData?.role=='driversAdmin')
      SalomonBottomBarItem(
        icon: Icon(TablerIcons.truck_delivery,color: MColors.colorPrimary,),
        activeIcon: Icon(TablerIcons.truck_delivery,color: MColors.colorPrimary,),
        title: Text("drivers".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),
      /// Profile
      SalomonBottomBarItem(
        icon: Icon(TablerIcons.user,color: MColors.colorPrimary,),
        activeIcon: Icon(TablerIcons.user,color: MColors.colorPrimary,),
        title: Text("profile".tr, style: MStyles.bottomNavStyle,),
        selectedColor: MColors.colorPrimary,
      ),
    ];
  }

}


