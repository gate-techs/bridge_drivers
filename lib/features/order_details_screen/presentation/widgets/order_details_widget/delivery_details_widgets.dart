import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../common_utils/common_utils.dart';
import '../../../../../common_utils/image_utils.dart';
import '../../../../../main.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
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
            color: MColors.colorPrimary,
            fontSize: 14,
            fontFamily: appFontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${'name'.tr} : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      orderDetailsRow?.name ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Gaps.vGap8,
                Text(
                  'phone'.tr,
                  style: TextStyle(
                    color: MColors.colorSecondaryDark,
                    fontSize: 14,
                    fontFamily: appFontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      orderDetailsRow?.mobile ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        CommonUtils.makePhoneCall(orderDetailsRow?.mobile ?? '');
                      },
                      child: ClipOval(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            color: MColors.colorPrimaryDark,
                            child: SvgPicture.asset(
                              ImageUtils.getAssetsPath('ic_call', 'svg', format: 'svg'),
                              height: 24,
                              width: 24,
                            )

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gaps.vGap8,
    ]
    ):const SizedBox();
  }
}
