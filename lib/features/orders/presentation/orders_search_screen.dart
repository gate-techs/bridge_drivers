import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/orders/presentation/widgets/orders_item.dart';
import 'package:kishk_driver/main.dart';
import 'package:lottie/lottie.dart';
import '../../../../res/m_colors.dart';
import '../../../res/styles.dart';
import '../../../shared/error_widget.dart';
import '../../../shared/loading_widget.dart';
import '../../../shared/result_widget/result_widget.dart';
import '../../order_details_screen/presentation/order_details_screen.dart';
import 'cubit/orders_cubit.dart';

class OrdersSearchScreen extends StatefulWidget {
  const OrdersSearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrdersSearchScreen> createState() => _OrdersSearchScreenState();
}

class _OrdersSearchScreenState extends State<OrdersSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
       OrdersCubit()
        ..getOrders({'paginate': 30}),
      child: BlocConsumer< OrdersCubit,  OrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
           OrdersCubit  ordersCubit =  OrdersCubit.get(context);
          //  OrdersListDataRows  OrdersListDataRows;
          return Scaffold(
            backgroundColor: MColors.screensBackgroundColor,
            appBar: AppBar(
              title:Text('orders'.tr, style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: appFontFamily,
                color: Colors.black,
              ),),
              bottom:PreferredSize(
                preferredSize: const Size(0, 50),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MColors.veryLightGray,
                        ),
                        child: TextFormField(
                          controller:  ordersCubit.search,
                          cursorColor: MColors.colorPrimary,
                          autofocus: true,
                          onChanged: (value) {
                            ordersCubit.getSearch({
                              'search': value,
                              'paginate': 30,
                              'mobile':true
                            });
                          },
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff212121),
                          ),
                          decoration: MStyles.textFieldStyle(
                              "searchOrder".tr,
                              const Icon(TablerIcons.search, color:Colors.black, size: 30,),
                              null),
                        ),
                      ),
                      ResultWidget(
                        title:
                        '${'searchResult'.tr} (${ ordersCubit.searchResults
                            .toString()})',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ordersCubit.search.text.isEmpty
                        ? Center(
                        child: Lottie.asset('assets/lottie/no_searsh.json',
                            width: 250, height: 250))
                        : BlocConsumer< OrdersCubit,  OrdersState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        // OrdersCubit  ordersCubit =  OrdersCubit.get(context);
                        if (state is  OrdersLoaded) {
                          final data = state.orders;
                          return Column(
                            children: [
                              ListView.builder(
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.length>20?20:data.length,
                                  itemBuilder: (ctx, index) {
                                    return  InkWell(
                                      onTap: () {
                                        Get.to(
                                            OrderDetailsScreen(
                                                id: data[index].id
                                                    .toString()));
                                      },
                                      child:  OrdersItem(
                                        ordersDataRows:
                                        data[index],
                                      ),
                                    );
                                  }),
                              // InkWell(
                              //   onTap:(){
                              //     Get.to(Main(apiKey: 'search', value:  OrdersCubit.search.text));
                              //   },
                              //   child: Center(
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(15.0),
                              //       child: Text('seeMore'.tr),
                              //     ),
                              //   ),
                              // )
                            ],
                          );
                        } else if (state is  OrdersFailed) {
                          return FailedWidget(
                            failedMessage: state.message,
                          );
                        } else {
                          return const Center(
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: LoadingWidget()));
                        }
                      },
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
