import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/invoice_screen/presentation/invoice_screen.dart';
import 'package:kishk_driver/features/order_details_screen/presentation/product_details_in_order/product_details_screen_in_order.dart';
import 'package:kishk_driver/features/order_details_screen/presentation/widgets/order_details_widget/delivery_details_widgets.dart';
import 'package:kishk_driver/features/order_details_screen/presentation/widgets/order_details_widget/order_price_item.dart';
import 'package:kishk_driver/res/gaps.dart';
import '../../../common_utils/log_utils.dart';
import '../../../helpers/hive_helper.dart';
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
          onPressed: () =>  Get.back(result: {'refresh': true}),
        ),
      ),
      body: BlocProvider(
        create: (context) => OrderDetailsCubit()..getOrderDetails(widget.id),
        child: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
          listener: (context, state) {
            Log.e(state.toString());
          },
          builder: (context, state) {
            OrderDetailsCubit orderDetailsCubit = context.read<OrderDetailsCubit>();
            if (state is OrderDetailsLoaded) {
              final data = state.orderDetails;
              return RefreshIndicator(
                backgroundColor: MColors.colorPrimaryLight,
                onRefresh: () async {
                  orderDetailsCubit.isRefresh = true;
                  orderDetailsCubit.getOrderDetails(widget.id);
                },
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderDetailsWidget(
                          orderDetailsRow: data,
                        ),
                        CustomerDetailsWidget(orderDetailsRow: data),
                        if(HiveHelper.getUserData()?.userData?.role=='driversAdmin')
                        DeliveryDetailsWidget(orderDetailsRow: data.delivery),
                        ExpansionTile(
                          controller: orderDetailsCubit.expansionTileController,
                          title: Text('${'items'.tr} : (${data.products?.length??0})',
                            style: TextStyle(
                                color: MColors.colorPrimary,fontFamily: appFontFamily,fontWeight: FontWeight.bold
                            ),
                          ),
                          children:[
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:data.products?.length,
                                itemBuilder: (context, index) =>
                                    InkWell(
                                      onTap: (){
                                        Get.to(ProductDetailsScreenInOrder(
                                          id: data.products?[index].encryptId??'',
                                          selectedAttributes: data.products?[index].selectedAttributes,
                                          productDetailsRow: data.products![index], productVendorDetailsRow: data.products![index].vendor!,));
                                      },
                                      child: OrderItem(
                                        orderDetailsRowProducts: data.products?[index],
                                        index: index + 1,
                                        isDelivered: (data.orderStatus?.toLowerCase() == 'delivered'),
                                        onChangedCallBack: (value ) async{
                                         if( value == true){
                                           if(  data.products?[index].isDispatched==true && data.products?[index].isShipped==false &&  data.products?[index].isDelivered==false){
                                             orderDetailsCubit.changeOrderStatus(
                                                 widget.id.toString(),'shipped',data.products?[index].shoppingCartId.toString()??'-1');
                                             orderDetailsCubit.isRefresh =true;
                                             await orderDetailsCubit.getOrderDetails(widget.id);
                                           }else if( data.products?[index].isDispatched==true && data.products?[index].isShipped==true &&  data.products?[index].isDelivered==false){
                                             orderDetailsCubit.changeOrderStatus(
                                                 widget.id.toString(),'delivered',data.products?[index].shoppingCartId.toString()??'-1'
                                             );
                                             orderDetailsCubit.isRefresh =true;
                                             await orderDetailsCubit.getOrderDetails(widget.id);
                                           }else{
                                             orderDetailsCubit.changeOrderStatus(
                                                 widget.id.toString(),'dispatched',state.orderDetails.products?[index].shoppingCartId.toString()??'-1'
                                             );
                                             orderDetailsCubit.isRefresh =true;
                                             await orderDetailsCubit.getOrderDetails(widget.id);
                                           }
                                         }
                                        },
                                      ),
                                    ))
                          ] ,
                        ),
                        OrderPriceItem(orderDetailsRow: data),

                        Gaps.vGap16,
                        InkWell(
                          onTap: () {
                            Log.e('id:0    ${data.encryptId}');
                            Get.to(InvoiceScreen(id: data.encryptId??''));
                          },
                          child: Center(
                            child: Container(
                              width: 250,
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: MColors.colorPrimary,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(TablerIcons.printer,color: Colors.white,),
                                  Gaps.hGap8,
                                  Text(
                                    'printReceipt'.tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      shadows: [
                                        BoxShadow(
                                          color: MColors.colorPrimary,
                                          offset: const Offset(4, 8),
                                          blurRadius: 24,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Gaps.vGap16,
                      ],
                )),
              );
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
