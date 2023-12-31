import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../common_utils/image_utils.dart';
import '../../events/bus_events.dart';
import '../../helpers/hive_helper.dart';
import '../auth/login/presentation/view/login_screen.dart';
import '../notifications/persentation/notifications_screen.dart';
import 'cubit/main_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, });


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  late MainCubit mMainCubit;

  @override
  void initState() {
    eventBus.on<NotificationsEventBus>().listen((event) {
      mMainCubit.getNotificationsCount();
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getCount(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit mMainCubit = MainCubit.get(context);
          return Scaffold(
            appBar: mMainCubit.currentIndex==0? AppBar(
              titleSpacing: 0.0,
              leading: InkWell(
                onTap: () {
                  if (HiveHelper.getUserToken().isEmpty) {
                    Get.to(const LoginScreen());
                  } else {
                    Get.to(const NotificationsScreen());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: mMainCubit.countNotifications == '0'
                        ? SvgPicture.asset(
                      width: 28,
                      height: 28,
                      ImageUtils.svgNotificationsIcon,
                    )
                        : Badge(
                      label: Text(mMainCubit.countNotifications),
                      largeSize: 18,
                      offset: const Offset(8, -8),
                      child: SvgPicture.asset(
                        width: 28,
                        height: 28,
                        ImageUtils.svgNotificationsIcon,
                      ),
                    ),
                  ),
                ),
              ),
              centerTitle: false,


            ):null,
            backgroundColor: const Color(0xffFAFAFA),
            body: mMainCubit.buildScreens().elementAt(mMainCubit.currentIndex),
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: mMainCubit.currentIndex,
              onTap: (index) => mMainCubit.updateSliderIndex(index),
              items: mMainCubit.bridgeNavBarsItems(),
            ),

          );
        },
      ),
    );
  }
}
