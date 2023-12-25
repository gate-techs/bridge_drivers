import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paginated_list/paginated_list.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/app_bar.dart';
import 'package:kishk_driver/shared/widgets/app_loading_widget.dart';
import 'package:kishk_driver/shared/widgets/empty_data_widget.dart';

import '../../../orders/presentation/orders_screen.dart';
import '../../data/my_orders_response.dart';
import '../cubit/home_cubit.dart';
import '../widgets/order_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getNotificationsCount()
        ..getOrdersCount(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit mHomeCubit = HomeCubit.get(context);
          if (state is HomeLoaded) {
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: CustomAppBar(
                    badgeCount: mHomeCubit.badgeCount,
                  )),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    mHomeCubit.getOrdersCount();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${'welcome'.tr} ${HiveHelper.getUserData()?.userData?.username ?? ''}',
                              style: const TextStyle(
                                  fontSize: 18, color: MColors.veryLightGray),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset("assets/icons/emoji.svg")
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Badge(
                                label: Text(
                                  mHomeCubit.newOrdersCount,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                largeSize: 25,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => const OrdersScreen(
                                        mOrdersStatus: OrdersStatus.news));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, 4),
                                            blurRadius: 8,
                                            spreadRadius: 0,
                                          )
                                        ]),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/logo.png',
                                          width: 80,
                                          height: 80,
                                        ),
                                        Text(
                                          'new_orders'.tr,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Badge(
                                label: Text(
                                  mHomeCubit.totalOrdersCount,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                  ),
                                ),
                                largeSize: 25,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => const OrdersScreen(
                                        mOrdersStatus: OrdersStatus.all));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, 4),
                                            blurRadius: 8,
                                            spreadRadius: 0,
                                          )
                                        ]),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/logo.png',
                                          width: 80,
                                          height: 80,
                                        ),
                                        Text(
                                          'all_orders'.tr,
                                          style: const TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.w600,),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        PaginatedList<MyOrdersDataRows>(
                          physics: const NeverScrollableScrollPhysics(),
                          loadingIndicator: const SizedBox(),
                          shrinkWrap: true,
                          items: state.mDataList,
                          isRecentSearch: false,
                          isLastPage: mHomeCubit.isLastIndex,
                          onLoadMore: (int index) {
                            // if (!mHomeCubit.isLastIndex) {
                            //   mHomeCubit.getLastOrders(
                            //       pageIndex: ++mHomeCubit.currentPageIndex);
                            // }
                          },
                          builder: (e, index) => OrderListItem(
                              data: state.mDataList[index],
                              refreshCallBack: () {
                                mHomeCubit.getOrdersCount();
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is HomeError) {
            return const EmptyDataWidget();
          } else {
            return const AppLoadingWidget();
          }
        },
      ),
    );
  }
}
