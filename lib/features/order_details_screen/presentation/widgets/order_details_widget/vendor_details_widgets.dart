import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../common_utils/common_utils.dart';
import '../../../../../common_utils/image_utils.dart';
import '../../../../../main.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
import '../../../data/order_details_entity.dart';

class VendorDetailsWidget extends StatelessWidget {
  const VendorDetailsWidget({Key? key, required this.productVendorDetailsRow})
      : super(key: key);
  final OrderDetailsDataRowProductsVendor? productVendorDetailsRow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 6),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
        ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: Colors.grey.withOpacity(0.3),
          tilePadding: const EdgeInsets.all(2),
          childrenPadding: const EdgeInsets.all(2),
          title:  Text(
            'vendorDetails'.tr,
            style: TextStyle(
              color: MColors.colorPrimary,
              fontSize: 14,
              fontFamily: appFontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Column(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      productVendorDetailsRow?.name ?? '',
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
                          productVendorDetailsRow?.mobile ?? '',
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
                            CommonUtils.makePhoneCall(productVendorDetailsRow?.mobile ?? '');
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
                            CommonUtils.whatsappMessage(productVendorDetailsRow?.mobile ?? '','Hello');
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
                      '${'location'.tr} : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap:() async {
                        final Uri launchUri = Uri.parse(Platform.isIOS
                            ?  productVendorDetailsRow?.location ?? ''
                            :  productVendorDetailsRow?.location ?? '');
                        await launchUrl(launchUri);
                      },
                      child: Text(
                        productVendorDetailsRow?.location ?? '',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontFamily: appFontFamily,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      productVendorDetailsRow?.city ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.bold,
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      productVendorDetailsRow?.province ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gaps.vGap10,
              ],
            ),
          ],

        ),
      ),
    );
  }
}
