import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/main.dart';
import 'package:paginated_list/paginated_list.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
import '../../../../../shared/error_widget.dart';
import '../../../../../shared/loading_widget.dart';
import '../../data/drivers_entity.dart';
import '../cubit/drivers_cubit.dart';
import 'drivers_item.dart';

class SelectDriverScreen extends StatefulWidget {
  const SelectDriverScreen({Key? key, required this.orderId,}) : super(key: key);
  final int orderId;


  @override
  State<SelectDriverScreen> createState() => _SelectDriverScreenState();
}

class _SelectDriverScreenState extends State<SelectDriverScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back(result: {'refresh': true});
          Get.back(result: {'refresh': true});
        }, icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),),
        title:  Text(
          'selectDriver'.tr,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: appFontFamily,fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
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
                                      onTap: () {
                                        driversCubit.assignDriver(widget.orderId, e.id??-1);
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
                  Get.back(result: {'refresh': true});
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
      )
    );
  }
}
