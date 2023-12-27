import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../main.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
import '../../../data/order_details_entity.dart';

class CustomerDetailsWidget extends StatelessWidget {
  const CustomerDetailsWidget({Key? key, required this.orderDetailsRow})
      : super(key: key);
  final OrderDetailsDataRow? orderDetailsRow;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.grey.withOpacity(0.3),
      title:  Text(
        'customer'.tr,
        style: TextStyle(
          color: MColors.colorPrimary,
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
                   '${'name'.tr} : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    orderDetailsRow?.user?.name ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Text(
              //       '${'customerEmail'.tr} :',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 16,
              //         fontFamily: appFontFamily,
              //         fontWeight: FontWeight.w700,
              //       ),
              //     ),
              //     Text(
              //       orderDetailsRow?.user?. ?? '',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 16,
              //         fontFamily: appFontFamily,
              //         fontWeight: FontWeight.w700,
              //       ),
              //     ),
              //   ],
              // ),
              // Gaps.vGap8,
              // Text(
              //   'phone'.tr,
              //   style: TextStyle(
              //     color: MColors.colorSecondaryDark,
              //     fontSize: 16,
              //     fontFamily: appFontFamily,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       orderDetailsRow?.user?.mobile ?? '',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 16,
              //         fontFamily: appFontFamily,
              //         fontWeight: FontWeight.w700,
              //       ),
              //     ),
              //     InkWell(
              //       onTap: (){
              //         CommonUtils.makePhoneCall(orderDetailsRow?.user?.mobile ?? '');
              //       },
              //       child: ClipOval(
              //         child: Container(
              //             padding: const EdgeInsets.all(10),
              //             color: MColors.colorPrimaryDark,
              //             child: SvgPicture.asset(
              //               ImageUtils.getAssetsPath('ic_call', 'svg', format: 'svg'),
              //               height: 24,
              //               width: 24,
              //             )
              //
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Gaps.vGap8,
              // Text(
              //   'shippingAddress'.tr,
              //   style: TextStyle(
              //     color: MColors.colorSecondaryDark,
              //     fontSize: 16,
              //     fontFamily: appFontFamily,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // Text(
              //   orderDetailsRow?.user?.address ?? '',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 16,
              //     fontFamily: appFontFamily,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // Gaps.vGap8,

              if(orderDetailsRow?.userNote !=null)
                Column(
                  children: [
                    Gaps.vGap8,
                    Text(
                      '${'orderNote'.tr} : ',
                      style: TextStyle(
                        color: MColors.colorSecondaryDark,
                        fontSize: 16,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      orderDetailsRow?.userNote ?? '',
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
      ],

    );
  }
}
