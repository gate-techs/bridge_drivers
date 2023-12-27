import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../main.dart';
import '../../../../res/gaps.dart';
import '../../data/product_details_entity.dart';

class RefundDialog extends StatelessWidget {
  const RefundDialog({super.key, required this.productDetailsDataRowVendor, });
  final ProductDetailsDataRowVendor productDetailsDataRowVendor;


  @override
  Widget build(BuildContext context) {
    return  Dialog(
      insetPadding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 400,
        height: 200,
        color: Colors.transparent,
        child:Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'refundAndExchangePolicy'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: appFontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.vGap10,

                Row(
                  children: [
                    Text(
                        '${'isRefundable'.tr} : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: appFontFamily,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            productDetailsDataRowVendor.isRefundable==true?
                            'yes'.tr:'no'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                Gaps.vGap8,
              Text(
                  productDetailsDataRowVendor.policy??'',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: appFontFamily,
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
