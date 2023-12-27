import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/shared/loading_widget.dart';
import 'package:paginated_list/paginated_list.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import 'package:kishk_driver/shared/widgets/empty_data_widget.dart';
import '../../data/orders_entity.dart';
import '../cubit/home_cubit.dart';
import '../widgets/order_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getOrdersCount()..getOrders({}),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit mHomeCubit = HomeCubit.get(context);
          if (state is HomeLoaded) {
            return Scaffold(
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
                                  fontSize: 18, color: Colors.black),
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
                                    // Get.to(() => const OrdersScreen(
                                    //     mOrdersStatus: OrdersStatus.news));
                                  },
                                  child: Container(
                                    width: 150,
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
                                          'assets/images/logo.png',
                                          width: 100,
                                          height: 100,
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
                                    // Get.to(() => const OrdersScreen(
                                    //     mOrdersStatus: OrdersStatus.all));
                                  },
                                  child: Container(
                                    width: 150,
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
                                          'assets/images/logo.png',
                                          width: 100,
                                          height: 100,
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
                        PaginatedList<OrdersDataRows>(
                          physics: const NeverScrollableScrollPhysics(),
                          loadingIndicator: const SizedBox(),
                          shrinkWrap: true,
                          items: state.dataList,
                          isRecentSearch: false,
                          isLastPage: mHomeCubit.isLastPageNew,
                          onLoadMore: (int index) {
                            // if (!mHomeCubit.isLastIndex) {
                            //   mHomeCubit.getLastOrders(
                            //       pageIndex: ++mHomeCubit.currentPageIndex);
                            // }
                          },
                          builder: (e, index) => OrderListItem(
                              data: e,
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
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}