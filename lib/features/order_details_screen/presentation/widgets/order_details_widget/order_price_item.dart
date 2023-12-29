import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
import '../../../../../shared/tow_text_row.dart';
import '../../../data/order_details_entity.dart';



class OrderPriceItem extends StatelessWidget {
  const OrderPriceItem({Key? key,required this.orderDetailsRow}) : super(key: key);
  final OrderDetailsDataRow? orderDetailsRow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 14),
      margin: const EdgeInsets.symmetric(vertical: 1),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TwoTextRow(
            title: 'subTotal'.tr,
            value: '${orderDetailsRow?.subTotal??''} ',
          ),
          Gaps.vGap20,
          Container(width: 500.sp,height:2,color: MColors.colorSecondaryLight,),
          Gaps.vGap20,
          TwoTextRow(
            title: 'tax'.tr,
            value: '${orderDetailsRow?.tax??''} ',
          ),
          Gaps.vGap20,
          Container(width: 500.sp,height:2,color: MColors.colorSecondaryLight,),
          Gaps.vGap20,
          TwoTextRow(
            title: 'discount'.tr,
            value: '${orderDetailsRow?.discount??''} ',
          ),
          Gaps.vGap20,
          Container(width: 500.sp,height:2,color: MColors.colorSecondaryLight,),
          Gaps.vGap20,
          TwoTextRow(
            title: 'deliveryFees'.tr,
            value: '${orderDetailsRow?.deliveryFees??''} ',
          ),
          Gaps.vGap20,
          Container(width: 500.sp,height:2,color: MColors.colorSecondaryLight,),
          Gaps.vGap20,
          TwoTextRow(
            title: 'total'.tr,
            value: '${orderDetailsRow?.grandTotal??''} ',
          ),
          Gaps.vGap20,

        ],
      ),
    );
  }
}
