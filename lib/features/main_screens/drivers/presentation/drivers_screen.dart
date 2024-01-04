import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/main_screens/drivers/presentation/drivers_search_screen.dart';
import 'package:kishk_driver/features/main_screens/drivers/presentation/search_bloc/search_bloc.dart';
import 'package:kishk_driver/features/main_screens/drivers/presentation/widgets/drivers_item.dart';
import 'package:paginated_list/paginated_list.dart';
import '../../../../main.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../../res/styles.dart';
import '../../../../shared/error_widget.dart';
import '../../../../shared/loading_widget.dart';
import '../../../../shared/result_widget/result_widget.dart';
import '../../../driver_details/presentation/screen/driver_details_screen.dart';
import '../data/drivers_entity.dart';
import 'cubit/drivers_cubit.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key, }) ;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
          return DriversCubit()..getDrivers({'paginate':30,'mobile' :true,});
      },
      child: BlocConsumer<DriversCubit, DriversState>(
        listener: (context, state) {},
        builder: (context, state) {
          DriversCubit driversCubit = DriversCubit.get(context);
          if (state is  DriversLoaded) {
            final data = state.drivers;
            return SafeArea(
              child: Scaffold(
                backgroundColor: MColors.screensBackgroundColor,
                appBar: AppBar(
                  title:Text('drivers'.tr, style:  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: appFontFamily,
                    color: Colors.black,
                  ),),
                  centerTitle: true,
                  bottom: PreferredSize(
                    preferredSize: const Size(0, 50),
                    child: Center(
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MColors.veryLightGray,
                        ),
                        child: TextFormField(
                          readOnly: true,
                          cursorColor: MColors.colorPrimary,
                          autofocus: true,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff212121),
                          ),
                          decoration: MStyles.textFieldStyle(
                              "searchDrivers".tr,
                              const Icon(TablerIcons.search, color: Colors.black),
                              null),
                    onTap: () async{
                      var res = await Get.to(
                      () => BlocProvider(
                        create: (context) =>DriversSearchBloc(),
                        child:  const DriversSearchScreen(fromAssignDrivers: false,orderId:null),),
                  );
                      if (res['refresh'] == true) {
                      driversCubit.currentPageIndex = 1;
                      driversCubit.isLastPage = false;
                      driversCubit.lastPage = 10;
                      driversCubit.listTotal = 0;
                      driversCubit.driversList.clear();
                      driversCubit.getDrivers({'mobile' :true,});
                      }
                      },
                        ),
                      ),
                    ),
                  ),
                ),
                body: RefreshIndicator(
                    backgroundColor: MColors.colorPrimaryLight,
                    onRefresh: () async {
                      driversCubit.driversList.clear();
                      driversCubit.isLastPage = false;
                      driversCubit.currentPageIndex = 1;
                      driversCubit
                          .getDrivers({

                        'mobile' :true,
                        'paginate': 30,
                        'page': driversCubit.currentPageIndex});
                    },
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.vGap10,
                        ResultWidget(title: '${'numberOfDrivers'.tr} (${data.length.toString()})',),
                        PaginatedList<DriversDataRows>(
                            loadingIndicator: const LoadingWidget(),
                            shrinkWrap: true,
                            items: data,
                            isRecentSearch: false,
                            isLastPage: driversCubit.isLastPage,
                            onLoadMore: (index) {
                              if (!driversCubit.isLastPage) {
                                driversCubit.getDrivers({
                                  'mobile' :true,
                                  'page': (++driversCubit.currentPageIndex).toString(),
                                  'paginate': 30,

                                });
                              }
                            },
                            builder: (DriversDataRows e, int index) {
                              return  InkWell(

                                  onTap: () async{
                                    var res = await Get.to(
                                            () =>  DriverDetailsScreen(dataRows: data[index],));
                                    if (res['refresh'] == true) {
                                      driversCubit.currentPageIndex = 1;
                                      driversCubit.isLastPage = false;
                                      driversCubit.lastPage = 10;
                                      driversCubit.listTotal = 0;
                                      driversCubit.driversList.clear();
                                      driversCubit.getDrivers({'mobile' :true,});
                                    }
                                  },
                                child: DriversItem(
                                  driversItemDataRows: e,
                                ),
                              );
                            }),
                      ],
                    ))),
              ),
            );
          } else if (state is  DriversFailed) {
            return  RefreshIndicator(
              backgroundColor: MColors.colorPrimaryLight,
              onRefresh: () async {
                driversCubit.driversList.clear();
                driversCubit.isLastPage = false;
                driversCubit.currentPageIndex = 1;
                driversCubit
                    .getDrivers({
                  'mobile' :true,
                  'paginate': 30,
                  'page': driversCubit.currentPageIndex,
                  });
              },
              child: Center(
                  child: FailedWidget(
                failedMessage: state.message,
              )),
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
