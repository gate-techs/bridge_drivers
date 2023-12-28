import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../common_utils/image_utils.dart';
import '../../events/bus_events.dart';
import '../../helpers/hive_helper.dart';
import '../auth/login/presentation/view/login_screen.dart';
import '../notifications/presentation/notifications_screen.dart';
import 'cubit/main_cubit.dart';
import 'domain/notifications_badge_count_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, });


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  String countNotifications = '0';

  @override
void initState() {
    eventBus.on<NotificationsEventBus>().listen((event) {
      getNotificationsCount();
    });
    super.initState();
  }

  void getCount() async {
    getNotificationsCount();
  }


  void getNotificationsCount() async {
    NotificationBadgeCountRepository notificationBadgeCountRepository =
    NotificationBadgeCountRepository();
    final resul =
    await notificationBadgeCountRepository.getNotificationBadgeCount();
    resul.fold((l) {
      countNotifications = '0';
    }, (r) {
      setState(() {
        if (r.data == null) {
          countNotifications = '0';
        } else {
          countNotifications = r.data?.badgeCount?.toString() ?? '0';
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit mMainCubit = MainCubit.get(context);
          return Scaffold(
            appBar: mMainCubit.currentIndex==0?AppBar(
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
                    child: countNotifications == '0'
                        ? SvgPicture.asset(
                      width: 28,
                      height: 28,
                      ImageUtils.svgNotificationsIcon,
                    )
                        : Badge(
                      label: Text(countNotifications),
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
              // actions: [
              //   InkWell(
              //     onTap: (){
              //         if(mMainCubit.currentIndex == 0){
              //           Get.to(const ProductsSearchScreen());
              //         }else if(mMainCubit.currentIndex == 1){
              //           Get.to(const BrandsSearchScreen());
              //         }else if(mMainCubit.currentIndex == 2){
              //           Get.to(const ProductsSearchScreen());
              //         }else if(mMainCubit.currentIndex == 3){
              //           Get.to(const OffersSearchScreen());
              //         }else if(mMainCubit.currentIndex == 4){
              //           Get.to(const OrdersSearchScreen());
              //         }
              //       },
              //     child: const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 8.0),
              //       child: Icon(TablerIcons.search, color:Colors.black),
              //     ),
              //   ),
              //   InkWell(
              //     onTap: (){
              //       Get.to(const ProfileScreen());
              //     },
              //     child: const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 8.0),
              //       child: Icon(TablerIcons.settings, color:Colors.black),
              //     ),
              //   ),
              // ],
              centerTitle: false,

              // bottom: PreferredSize(
              //   preferredSize: const Size(0, 50),
              //   child: Container(
              //     height: 40,
              //     margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              //     child: TextFormField(
              //       textAlignVertical: TextAlignVertical.bottom,
              //       cursorColor: Colors.black,
              //       readOnly: true,
              //       onTap: () {
              //         if(mMainCubit.currentIndex == 0){
              //           Get.to(const ProductsSearchScreen());
              //         }else if(mMainCubit.currentIndex == 1){
              //           Get.to(const BrandsSearchScreen());
              //         }else if(mMainCubit.currentIndex == 2){
              //           Get.to(const ProductsSearchScreen());
              //         }else if(mMainCubit.currentIndex == 3){
              //           Get.to(const OffersSearchScreen());
              //         }else if(mMainCubit.currentIndex == 4){
              //           Get.to(const OrdersSearchScreen());
              //         }
              //       },
              //       decoration: InputDecoration(
              //           fillColor: MColors.appInputColor.withOpacity(0.3),
              //           filled: true,
              //           hintText:
              //           mMainCubit.currentIndex == 0?'searchProduct'.tr:
              //           mMainCubit.currentIndex == 1?'searchForBrands'.tr:
              //           mMainCubit.currentIndex == 2?'searchProduct'.tr:
              //           mMainCubit.currentIndex == 3?'searchForOffers'.tr:
              //           mMainCubit.currentIndex == 4?'searchOrder'.tr:
              //           'searchForBrands'.tr,
              //           prefixIcon: const Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Icon(TablerIcons.search, color: Colors.black, size: 30,),
              //           ),
              //           contentPadding: const EdgeInsets.symmetric(vertical: 14),
              //           hintStyle: TextStyle(
              //               color: Colors.black,
              //               fontSize: 14,
              //               fontWeight: FontWeight.bold,
              //               fontFamily: appFontFamily),
              //           border: InputBorder.none,
              //           focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(15.0),
              //             borderSide:
              //             const BorderSide(color: MColors.appInputColor, width: 1.0),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(15.0),
              //               borderSide: const BorderSide(
              //                   color: MColors.appInputColor, width: 1.0))),
              //       keyboardType: TextInputType.text,
              //     ),
              //   ),
              // ),
            ):null,
            backgroundColor: const Color(0xffFAFAFA),
            body: mMainCubit.buildScreens().elementAt(mMainCubit.currentIndex),
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: mMainCubit.currentIndex,
              onTap: (index) => mMainCubit.updateSliderIndex(index),
              items: mMainCubit.bridgeNavBarsItems(),
            ),
            // floatingActionButton:(mMainCubit.currentIndex == 2 || mMainCubit.currentIndex == 3)? FloatingActionButton(
            //   onPressed: () {
            //       if(mMainCubit.currentIndex == 2){
            //           Get.to(const AddProductScreen());
            //         }else if(mMainCubit.currentIndex == 3){
            //            Get.to(const AddProductScreen());
            //         }
            //   },
            //   backgroundColor: MColors.colorPrimary,
            //   child:const Icon(Icons.add, color: Colors.white,),
            // ):null,
          );
        },
      ),
    );
  }
}
