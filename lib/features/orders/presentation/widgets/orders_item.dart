import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/features/order_details_screen/presentation/order_details_screen.dart';
import 'package:kishk_driver/helpers/hive_helper.dart';
import '../../../../../main.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../main_screens/drivers/presentation/widgets/select_driver_screen.dart';
import '../../../main_screens/home/data/orders_entity.dart';

class OrdersItem extends StatelessWidget {
  const    OrdersItem({super.key, required this.ordersDataRows, required this.onChangedCallBack});

  final OrdersDataRows ordersDataRows;
  final Function(bool) onChangedCallBack;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 6),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${'code'.tr } ${ ordersDataRows.orderNo ?? ' '}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.vGap8,
                  Text(
                    '${'total'.tr }: ${ ordersDataRows.totalGrandPrice ?? ''} ${'KWD'.tr}',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ordersDataRows.orderedDate ?? '',
                    style: TextStyle(
                      color: MColors.colorSecondaryDark,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.vGap8,
                  Text(
                  (ordersDataRows.orderStatus??"").tr,
                    style: TextStyle(
                      fontSize: 14,
                      color:ordersDataRows.orderStatus=='pending'?Colors.red:ordersDataRows.orderStatus=='delivered'?Colors.green:MColors.colorPrimary,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                ],
              )
            ],
          ),
          if(HiveHelper.getUserData()?.userData?.role=='driversAdmin')
          const Divider(),
           if(HiveHelper.getUserData()?.userData?.role=='driversAdmin')
            (ordersDataRows.driver?.id == null)?
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 InkWell(
                             onTap: ()async{
                  var res = await Get.to(() =>  SelectDriverScreen(orderId: ordersDataRows.id??-1,));
                  if (res['refresh'] == true) {
                    onChangedCallBack.call(true);
                  }

                             },
                             child: Container(
                  width: 100,
                  height: 40,
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MColors.colorPrimary,
                  ),
                  child:  Center(
                    child: Text('assignDriver'.tr, style:  TextStyle(
                        fontSize: 12,
                        color:Colors.white,
                      fontFamily: appFontFamily,
                    ),),
                  ),
                             ),
                           ),
                 InkWell(
                   onTap: ()async{
                     var res = await Get.to(() =>  OrderDetailsScreen(id: ordersDataRows.id.toString(),));
                     if (res['refresh'] == true) {
                       onChangedCallBack.call(true);
                     }
                   },
                   child: Container(
                     alignment: Alignment.center,
                     width: 40,
                     height: 40,
                     margin: const EdgeInsets.all(2),
                     padding: const EdgeInsets.all(2),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: MColors.colorPrimary,
                     ),
                     child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                     // Text('reAssignDriver'.tr, style:  TextStyle(
                     //     fontSize: 12,
                     //     color:Colors.white,
                     //     fontFamily: appFontFamily
                     // ),),
                   ),
                 ),
               ],
             ):Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: CommonUtils.getISTablet(context)?380:170,
                child: Text(
                  '${'driverName'.tr } : ${ ordersDataRows.driver?.name ?? ' '}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: appFontFamily,
                  ),
                ),
              ),
              if(ordersDataRows.orderStatus !='delivered')
              InkWell(
                  onTap: ()async{
                    var res = await Get.to(() =>  SelectDriverScreen(orderId: ordersDataRows.id??-1,));
                    if (res['refresh'] == true) {
                      onChangedCallBack.call(true);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MColors.colorPrimary,
                    ),
                    child:  Text('reAssignDriver'.tr, style:  TextStyle(
                        fontSize: 12,
                        color:Colors.white,
                      fontFamily: appFontFamily
                    ),),
                  ),
                ),
              InkWell(
                onTap: ()async{
                  var res = await Get.to(() =>  OrderDetailsScreen(id: ordersDataRows.id.toString(),));
                  if (res['refresh'] == true) {
                    onChangedCallBack.call(true);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MColors.colorPrimary,
                  ),
                  child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  // Text('reAssignDriver'.tr, style:  TextStyle(
                  //     fontSize: 12,
                  //     color:Colors.white,
                  //     fontFamily: appFontFamily
                  // ),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

