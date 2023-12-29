import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:paginated_list/paginated_list.dart';
import '../../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../../shared/error_widget.dart';
import '../../../../shared/loading_widget.dart';
import '../../data/drivers_entity.dart';
import '../cubit/drivers_cubit.dart';
import 'drivers_item.dart';

class SelectDriverBottomSheet extends StatefulWidget {
  const SelectDriverBottomSheet({
    Key? key,
    required this.callBack,
  }) : super(key: key);
  final Function() callBack;

  @override
  State<SelectDriverBottomSheet> createState() => _SelectDriverBottomSheetState();
}

class _SelectDriverBottomSheetState extends State<SelectDriverBottomSheet> {

  String orderStatus = 'pending'.tr;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      height: 600,
      child: BlocProvider(
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
                              Gaps.vGap8,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'drivers'.tr,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'selectDriver'.tr,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black54,
                                      ))
                                ],
                              ),
                              Gaps.vGap8,
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
                                        widget.callBack.call();
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
      )
    );
  }
}
