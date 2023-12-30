import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/main_screens/drivers/presentation/widgets/drivers_item.dart';
import 'package:paginated_list/paginated_list.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
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
