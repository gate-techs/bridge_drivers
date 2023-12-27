import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../main.dart';
import '../../../../../res/gaps.dart';
import '../../../data/order_details_entity.dart';

class DeliveryDetailsWidget extends StatelessWidget {
  const DeliveryDetailsWidget({Key? key, required this.orderDetailsRow})
      : super(key: key);
  final OrderDetailsDataRowDelivery? orderDetailsRow;

  @override
  Widget build(BuildContext context) {
    return
      orderDetailsRow?.name !=null?
      ExpansionTile(
        iconColor: Colors.grey.withOpacity(0.3),
        title:Text(
          'delivery'.tr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: appFontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${'deliveryName'.tr} : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      orderDetailsRow?.name ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Gaps.vGap10,
              ],
            ),
          ),
    ]
    ):const SizedBox();
  }
}
