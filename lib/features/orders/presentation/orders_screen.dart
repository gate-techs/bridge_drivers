import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:paginated_list/paginated_list.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/res/gaps.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/app_loading_widget.dart';
import 'package:kishk_driver/shared/widgets/empty_data_widget.dart';

import '../../home/data/my_orders_response.dart';
import '../../home/presentation/widgets/order_item.dart';
import 'cubit/orders_cubit.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key, required this.mOrdersStatus});

  final OrdersStatus mOrdersStatus;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrdersCubit? mOrdersCubit;
  int length = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.mOrdersStatus == OrdersStatus.news
                ? 'new_orders'.tr
                : 'all_orders'.tr,
            style: const TextStyle(
                color: MColors.colorPrimary, fontFamily: 'Tajawal')),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: MColors.colorPrimary,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              cursorColor: Colors.black,
              controller: mOrdersCubit?.searchController,
              decoration: InputDecoration(
                  fillColor: MColors.appInputColor,
                  filled: true,
                  hintText: 'search_hint'.tr,
                  prefixIcon: const Icon(
                    Iconsax.search_normal,
                    color: Colors.black,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      mOrdersCubit?.searchController.clear();
                      mOrdersCubit?.resetListConfig();
                      mOrdersCubit?.getLastOrders(status: widget.mOrdersStatus);
                    },
                    child: const Icon(
                      Iconsax.close_circle,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  hintStyle: const TextStyle(
                      color: Colors.black, fontSize: 12, fontFamily: "Tajawal"),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                        color: MColors.appInputColor, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: MColors.appInputColor, width: 1.0))),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                mOrdersCubit?.resetListConfig();
                mOrdersCubit?.getLastOrders(
                    status: widget.mOrdersStatus, searchKeyWord: value);
              },
            ),
          ),
          Gaps.vGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('${mOrdersCubit?.totalLength ?? ''} ${'results'.tr} '),
              ),
            ],
          ),
          Expanded(
            child: BlocProvider(
              create: (context) =>
                  OrdersCubit()..getLastOrders(status: widget.mOrdersStatus),
              child: BlocConsumer<OrdersCubit, OrdersState>(
                listener: (context, state) {
                  if (state is OrdersLoaded) {
                    setState(() {
                      length = mOrdersCubit?.totalLength ?? 0;
                    });
                  }
                },
                builder: (context, state) {
                  mOrdersCubit = OrdersCubit.get(context);
                  if (state is OrdersLoaded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          mOrdersCubit?.resetListConfig();
                          mOrdersCubit?.getLastOrders(
                              status: widget.mOrdersStatus);
                        },
                        child: PaginatedList<MyOrdersDataRows>(
                          loadingIndicator: const AppLoadingWidget(),
                          shrinkWrap: true,
                          items: state.mDataList,
                          isRecentSearch: false,
                          isLastPage: mOrdersCubit!.isLastIndex,
                          onLoadMore: (int index) {
                            if (!mOrdersCubit!.isLastIndex) {
                              mOrdersCubit?.getLastOrders(
                                  status: widget.mOrdersStatus,
                                  pageIndex: ++mOrdersCubit!.currentPageIndex);
                            }
                          },
                          builder: (e, index) => OrderListItem(
                              data: state.mDataList[index],
                              refreshCallBack: () {
                                mOrdersCubit?.getLastOrders(
                                    status: widget.mOrdersStatus);
                              }),
                        ),
                      ),
                    );
                  } else if (state is OrdersError) {
                    return const EmptyDataWidget();
                  } else {
                    return const AppLoadingWidget();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
