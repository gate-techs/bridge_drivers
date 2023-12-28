import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../main.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../main_screens/home/data/orders_entity.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({super.key, required this.ordersDataRows});

  final OrdersDataRows ordersDataRows;

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
      child: Row(
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
                  color:ordersDataRows.orderStatus=='pending'?Colors.red:MColors.colorPrimary,
                  fontFamily: appFontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}

