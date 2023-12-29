import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/order_details_screen/presentation/product_details_in_order/product_details_screen_in_order.dart';
import 'package:kishk_driver/features/order_details_screen/presentation/widgets/order_details_widget/delivery_details_widgets.dart';
import 'package:kishk_driver/features/order_details_screen/presentation/widgets/order_details_widget/order_price_item.dart';
import '../../../main.dart';
import '../../../res/m_colors.dart';
import '../../../shared/error_widget.dart';
import '../../../shared/loading_widget.dart';
import 'cubit/order_details_cubit.dart';
import 'widgets/order_details_widget/customer_details_widgets.dart';
import 'widgets/order_details_widget/order_details_widgets.dart';
import 'widgets/order_details_widget/order_item.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.screensBackgroundColor,
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          "orderDetails".tr,
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
          onPressed: () => Get.back(),
        ),
      ),
      body: BlocProvider(
        create: (context) => OrderDetailsCubit()..getOrderDetails(widget.id),
        child: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            OrderDetailsCubit orderDetailsCubit = OrderDetailsCubit();
            if (state is OrderDetailsLoaded) {
              final data = state.orderDetails;
              return SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailsWidget(
                        orderDetailsRow: data,
                      ),
                      CustomerDetailsWidget(orderDetailsRow: data),
                      DeliveryDetailsWidget(orderDetailsRow: data.delivery),
                      ExpansionTile(
                        title: Text('${'items'.tr} : (${data.products!.length})',
                          style: TextStyle(
                              color: MColors.colorPrimary,fontFamily: appFontFamily,fontWeight: FontWeight.bold
                          ),
                        ),
                        children:[
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.products!.length,
                              itemBuilder: (context, index) =>
                                  InkWell(
                                    onTap: (){
                                      Get.to(ProductDetailsScreenInOrder(id:  data.products?[index].encryptId??'', selectedAttributes:  data.products?[index].selectedAttributes,));
                                    },
                                    child: OrderItem(
                                      orderDetailsRowProducts:
                                      data.products?[index],
                                      index: index + 1,
                                      isDelivered: (data.orderStatus?.toLowerCase() == 'delivered'),
                                      onChangedCallBack: ( ) {
                                        setState(() {

                                          if(  data.products?[index].isDispatched==true){
                                            orderDetailsCubit.changeOrderStatus(
                                                widget.id.toString(),'shipped',data.products?[index].shoppingCartId.toString()??'-1'
                                            );
                                            orderDetailsCubit.isRefresh =true;
                                            orderDetailsCubit.getOrderDetails(widget.id);
                                          }else if(  data.products?[index].isShipped==true){
                                            orderDetailsCubit.changeOrderStatus(
                                                widget.id.toString(),'delivered',data.products?[index].shoppingCartId.toString()??'-1'
                                            );
                                            orderDetailsCubit.isRefresh =true;
                                            orderDetailsCubit.getOrderDetails(widget.id);
                                          }else{
                                            orderDetailsCubit.changeOrderStatus(
                                                widget.id.toString(),'dispatched',state.orderDetails.products?[index].shoppingCartId.toString()??'-1'
                                            );
                                            orderDetailsCubit.isRefresh =true;
                                            orderDetailsCubit.getOrderDetails(widget.id);
                                          }
                                        });

                                      },
                                    ),
                                  ))
                        ] ,
                      ),
                      OrderPriceItem(orderDetailsRow: data),


                    ],
              ));
            } else if (state is OrderDetailsFailed) {
              return FailedWidget(
                failedMessage: state.message,
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
