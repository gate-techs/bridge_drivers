import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/features/orders/presentation/orders_screen.dart';
import '../../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    Key? key,
    required this.callBack,
  }) : super(key: key);
  final Function() callBack;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {

  String orderStatus = 'pending'.tr;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      height: 380,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'filter'.tr,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'selectOrderStatus'.tr,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black54,
                  ))
            ],
          ),
          Gaps.vGap8,
          Center(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 'pending'.tr,
                      groupValue: orderStatus,
                      onChanged: (value) {
                        setState(() {
                          orderStatus = value??'';
                        });
                      },
                    ),
                    Text('pending'.tr, style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 'dispatched'.tr,
                      groupValue: orderStatus,
                      onChanged: (value) {
                        setState(() {
                          orderStatus = value??'';
                        });
                      },
                    ),
                    Text('dispatched'.tr, style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 'shipped'.tr,
                      groupValue: orderStatus,
                      onChanged: (value) {
                        setState(() {
                          orderStatus = value??'';
                        });
                      },
                    ),
                    Text('shipped'.tr, style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 'delivered'.tr,
                      groupValue: orderStatus,
                      onChanged: (value) {
                        setState(() {
                          orderStatus = value??'';
                        });
                      },
                    ),
                    Text('delivered'.tr, style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        if(orderStatus=='pending'.tr){
                          Get.to(const OrdersScreen(keyX: 'orderStatus', value: 'pending'));
                        }else if(orderStatus=='dispatched'.tr){
                          Get.to(const OrdersScreen(keyX: 'orderStatus', value: 'dispatched'));
                        }else if(orderStatus=='shipped'.tr){
                          Get.to(const OrdersScreen(keyX: 'orderStatus', value: 'shipped'));
                        }else if(orderStatus=='delivered'.tr){
                          Get.to(const OrdersScreen(keyX: 'orderStatus', value: 'delivered'));
                        }
                    },
                      child: Container(
                        width: 150,
                        height: 40,
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MColors.colorPrimary,
                        ),
                        child:  Center(
                          child: Text('apply'.tr, style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:Colors.white
                          ),),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        width: 150,
                        height: 40,
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(width: 0.5,color:MColors.colorPrimary)
                        ),
                        child:  Center(
                          child: Text('cancel'.tr, style:  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:MColors.colorPrimary
                          ),),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
