import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/shared/loading_widget.dart';
import 'package:paginated_list/paginated_list.dart';
import 'package:kishk_driver/shared/widgets/empty_data_widget.dart';

import '../../../../common_utils/common_utils.dart';
import '../../../../common_utils/image_utils.dart';
import '../../../../main.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../drivers/data/drivers_entity.dart';
import '../../../order_details_screen/presentation/order_details_screen.dart';
import '../../data/driver_details_entity.dart';
import '../cubit/driver_details_cubit.dart';
import '../widgets/orders_driver_item.dart';

class DriverDetailsScreen extends StatelessWidget {
  const DriverDetailsScreen({super.key, required this.dataRows});
  final DriversDataRows dataRows;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriverDetailsCubit()..getOrders(dataRows.id.toString()),
      child: BlocConsumer<DriverDetailsCubit, DriverDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          DriverDetailsCubit mDriverDetailsCubit = DriverDetailsCubit.get(context);
          if (state is DriverDetailsLoaded) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Text(
                  "driverDetails".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: appFontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () =>  Get.back(result: {'refresh': true}),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    mDriverDetailsCubit.getOrders(dataRows.id.toString());
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${'name'.tr} : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: appFontFamily,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    dataRows.name ?? '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: appFontFamily,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Text(
                                'phone'.tr,
                                style: TextStyle(
                                  color: MColors.colorSecondaryDark,
                                  fontSize: 14,
                                  fontFamily: appFontFamily,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dataRows.mobile ?? '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: appFontFamily,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      CommonUtils.makePhoneCall(dataRows.mobile ?? '');
                                    },
                                    child: ClipOval(
                                      child: Container(
                                          padding: const EdgeInsets.all(10),
                                          color: MColors.colorPrimaryDark,
                                          child: SvgPicture.asset(
                                            ImageUtils.getAssetsPath('ic_call', 'svg', format: 'svg'),
                                            height: 24,
                                            width: 24,
                                          )

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          ('orders').tr,
                          style: TextStyle(
                            fontSize: 14,
                            color:MColors.colorPrimary,
                            fontFamily: appFontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gaps.vGap8,
                        PaginatedList<DriverDetailsDataRows>(
                          physics: const NeverScrollableScrollPhysics(),
                          loadingIndicator: const SizedBox(),
                          shrinkWrap: true,
                          items: mDriverDetailsCubit.ordersList,
                          isRecentSearch: false,
                          isLastPage: mDriverDetailsCubit.isLastPage,
                          onLoadMore: (int index) {
                            // if (!mDriverDetailsCubit.isLastIndex) {
                            //   mDriverDetailsCubit.getLastOrders(
                            //       pageIndex: ++mDriverDetailsCubit.currentPageIndex);
                            // }
                          },
                          builder: (e, index) => InkWell(
                            onTap: () async{
                              var res = await Get.to(
                                      () =>  OrderDetailsScreen(id: e.id.toString(),));
                              if (res['refresh'] == true) {
                                mDriverDetailsCubit.currentPageIndex = 1;
                                mDriverDetailsCubit.isLastPage = false;
                                mDriverDetailsCubit.lastPage = 0;
                                mDriverDetailsCubit.listTotal = 0;
                                mDriverDetailsCubit.ordersList.clear();
                                mDriverDetailsCubit.getOrders(dataRows.id.toString());
                              }

                            },
                            child: OrdersDriverItem(
                              ordersDataRows: e,
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is DriverDetailsError) {
            return const EmptyDataWidget();
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}