import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../common_utils/common_utils.dart';
import '../../../../../common_utils/image_loader.dart';
import '../../../../../main.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
import '../../../data/order_details_entity.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {Key? key, required this.orderDetailsRowProducts, required this.index, required this.isDelivered, required this.onChangedCallBack})
      : super(key: key);
  final OrderDetailsDataRowProducts? orderDetailsRowProducts;
  final int index;
  final bool isDelivered;
  final Function(bool) onChangedCallBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
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
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: MColors.imageBg,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: MColors.imageBg,
                          width: 2,
                        )),
                    child: ImageLoader.loadDefaultWithPlaceHolder(
                        orderDetailsRowProducts?.media?.url ?? '',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill),
                  ),
                  Gaps.vGap8,
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width:CommonUtils.getISTablet(context)?400:150,
                          child: Text(
                            orderDetailsRowProducts?.title ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.vGap8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${'quantity'.tr} : ",
                                  style: TextStyle(
                                    color: MColors.colorSecondaryDark,
                                    fontSize: 14,
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  orderDetailsRowProducts?.qty ?? '',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (orderDetailsRowProducts?.isDelivered==false)?
              InkWell(
                onTap:(){
                  onChangedCallBack.call(true);
                },
                child: Container(
                  width: 100,
                  height: 30,
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                  decoration: BoxDecoration(
                    color: MColors.colorPrimary,
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
                  child: Center(child: Text(
                    (orderDetailsRowProducts?.isDispatched==true && orderDetailsRowProducts?.isShipped==false && orderDetailsRowProducts?.isDelivered==false)?'shipped'.tr:
                    (orderDetailsRowProducts?.isDispatched==true && orderDetailsRowProducts?.isShipped==true &&  orderDetailsRowProducts?.isDelivered==false)?'delivered'.tr:'dispatched'.tr
                    ,style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: appFontFamily,
                    fontWeight: FontWeight.bold,
                  ),)),
                ),
              ):
              Text(
              'delivered'.tr
                ,style: TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.bold,
              ),),
              Gaps.vGap20,
              Text(
                '${orderDetailsRowProducts?.totalPrice ?? ''} ${'KWD'.tr}',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
