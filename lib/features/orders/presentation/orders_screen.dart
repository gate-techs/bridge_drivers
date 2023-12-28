import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/orders/presentation/widgets/orders_item.dart';
import 'package:paginated_list/paginated_list.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../main.dart';
import '../../../shared/error_widget.dart';
import '../../../shared/loading_widget.dart';
import '../../../shared/result_widget/result_widget.dart';
import '../../main_screens/home/data/orders_entity.dart';
import '../../order_details_screen/presentation/order_details_screen.dart';
import 'cubit/orders_cubit.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key,  required this.keyX, required this.value,}) ;
  final String keyX;
  final String value;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
          return OrdersCubit()..getOrders({'paginate':30,widget.keyX:widget.value});
      },
      child: BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          OrdersCubit ordersCubit = OrdersCubit.get(context);
          if (state is  OrdersLoaded) {
            final data = state.orders;
            return Scaffold(
              backgroundColor: MColors.screensBackgroundColor,
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
                  onPressed: (){
                    Get.back();
                  },
                ),
                title:Text('orders'.tr, style:  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: appFontFamily,
                  color: Colors.black,
                ),),
              ),
              body: RefreshIndicator(
                  backgroundColor: MColors.colorPrimaryLight,
                  onRefresh: () async {
                    ordersCubit.ordersList.clear();
                    ordersCubit.isLastPage = false;
                    ordersCubit.currentPageIndex = 1;
                    ordersCubit
                        .getOrders({
                      widget.keyX:widget.value,
                      'paginate': 30,
                      'page': ordersCubit.currentPageIndex});
                  },
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.vGap10,
                      ResultWidget(title: '${'numberOfOrders'.tr} (${data.length.toString()})',),
                      PaginatedList<OrdersDataRows>(
                          loadingIndicator: const LoadingWidget(),
                          shrinkWrap: true,
                          items: data,
                          isRecentSearch: false,
                          isLastPage: ordersCubit.isLastPage,
                          onLoadMore: (index) {
                            if (!ordersCubit.isLastPage) {
                              ordersCubit.getOrders({
                                'page': (++ordersCubit.currentPageIndex).toString(),
                                'paginate': 30,
                                widget.keyX:widget.value
                              });
                            }
                          },
                          builder: (OrdersDataRows e, int index) {
                            return  InkWell(
                              onTap: () {
                                Get.to(
                                    OrderDetailsScreen(id: e.id.toString(),)
                                );
                              },
                              child: OrdersItem(
                                ordersDataRows: e,
                              ),
                            );
                          }),
                    ],
                  ))),
            );
          } else if (state is  OrdersFailed) {
            return  RefreshIndicator(
              backgroundColor: MColors.colorPrimaryLight,
              onRefresh: () async {
                ordersCubit.ordersList.clear();
                ordersCubit.isLastPage = false;
                ordersCubit.currentPageIndex = 1;
                ordersCubit
                    .getOrders({
                  'paginate': 30,
                  'page': ordersCubit.currentPageIndex,
                  widget.keyX:widget.value});
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
