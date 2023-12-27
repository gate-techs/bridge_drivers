import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/orders/presentation/widgets/orders_item.dart';
import 'package:lottie/lottie.dart';
import '../../../../main.dart';
import '../../../../res/m_colors.dart';
import '../../../../res/styles.dart';
import '../../../shared/error_widget.dart';
import '../../../shared/loading_widget.dart';
import '../../../shared/result_widget/result_widget.dart';
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
            body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        // Get.to(
                                        //     ProductDetailsScreen(
                                        //         id: data[index].encryptId
                                        //             .toString()));
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
