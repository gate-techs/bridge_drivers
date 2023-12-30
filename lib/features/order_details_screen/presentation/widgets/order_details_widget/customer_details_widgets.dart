import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../common_utils/common_utils.dart';
import '../../../../../common_utils/image_utils.dart';
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
                    orderDetailsRow?.user?.name ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '${'phone'.tr} : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: appFontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        orderDetailsRow?.user?.mobile ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: appFontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          CommonUtils.makePhoneCall(orderDetailsRow?.user?.mobile ?? '');
                        },
                        child: ClipOval(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              color: MColors.colorPrimaryDark,
                              child: SvgPicture.asset(
                                ImageUtils.getAssetsPath('ic_call', 'svg', format: 'svg'),
                                height: 20,
                                width: 20,
                              )

                          ),
                        ),
                      ),
                      Gaps.hGap4,
                      InkWell(
                        onTap: (){
                          CommonUtils.whatsappMessage(orderDetailsRow?.user?.mobile ?? '','Hello');
                        },
                        child: ClipOval(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.green,
                              child: Image.asset(
                                'assets/images/whatsapp.png',
                                height: 20,
                                width: 20,
                              )

                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'shippingAddress'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap8,
              Row(
                children: [
                  Text(
                    '${'city'.tr} : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    orderDetailsRow?.user?.city ?? '',
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
              Row(
                children: [
                  Text(
                    '${'province'.tr} : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    orderDetailsRow?.user?.province ?? '',
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
                orderDetailsRow?.user?.address ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.vGap8,

              if(orderDetailsRow?.userNote !=null)
                Column(
                  children: [
                    Gaps.vGap8,
                    Text(
                      '${'orderNote'.tr} : ',
                      style: TextStyle(
                        color: MColors.colorSecondaryDark,
                        fontSize: 14,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      orderDetailsRow?.userNote ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
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
