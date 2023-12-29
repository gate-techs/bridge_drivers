import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../../../main.dart';
import '../../../../../res/gaps.dart';
import '../../../../../res/m_colors.dart';
import '../../../data/order_details_entity.dart';

class OrderDetailsWidget extends StatefulWidget {
  const OrderDetailsWidget({Key? key, required this.orderDetailsRow})
      : super(key: key);
  final OrderDetailsDataRow? orderDetailsRow;

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  int activeStep = 0;
  String status = '';

  @override
  void initState() {
    if (widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'pending')  {
      activeStep = 0;
      status = 'pending'.tr;
    } else if (widget.orderDetailsRow?.orderStatus?.toLowerCase() ==
        'dispatched') {
      activeStep = 1;
      status = 'dispatched'.tr;
    } else if (widget.orderDetailsRow?.orderStatus?.toLowerCase() ==
        'shipped') {
      activeStep = 2;
      status = 'shipped'.tr;
    } else if (widget.orderDetailsRow?.orderStatus?.toLowerCase() ==
        'delivered') {
      activeStep = 3;
      status = 'delivered'.tr;
    } else {
      activeStep = 5;
      status = 'canceled'.tr;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${'code'.tr} : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.orderDetailsRow?.orderNo ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.orderDetailsRow?.grandTotal ?? ''} ${'KWD'.tr}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: MColors.colorPrimary,
                    borderRadius: BorderRadius.circular(10),
                  )),
              Gaps.hGap10,
              Text(
                '${'orderedDate'.tr} : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
              Text(
                widget.orderDetailsRow?.orderedDate ==''?
                'notDetermined'.tr:
                widget.orderDetailsRow?.orderedDate ??
                    'notDetermined'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
            ],
          ),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: MColors.colorPrimary,
                    borderRadius: BorderRadius.circular(10),
                  )),
              Gaps.hGap10,
              Text(
                '${'dispatchedDate'.tr} : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
              Text(
                widget.orderDetailsRow?.dispatchedDate ==''?
                'notDetermined'.tr:
                widget.orderDetailsRow?.dispatchedDate ??
                    'notDetermined'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
            ],
          ),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: MColors.colorPrimary,
                    borderRadius: BorderRadius.circular(10),
                  )),
              Gaps.hGap10,
              Text(
                '${'shippedDate'.tr} : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
              Text(
                widget.orderDetailsRow?.shippedDate ==''?
                'notDetermined'.tr:
                widget.orderDetailsRow?.shippedDate
                    ?? 'notDetermined'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
            ],
          ),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: MColors.colorPrimary,
                    borderRadius: BorderRadius.circular(10),
                  )),
              Gaps.hGap10,
              Text(
                '${'deliveredDate'.tr} : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
              Text(
                widget.orderDetailsRow?.deliveredDate ==''?
                'notDetermined'.tr:
                widget.orderDetailsRow?.deliveredDate
                    ?? 'notDetermined'.tr,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
            ],
          ),
          Gaps.vGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${'status'.tr} : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
              Text(
                (widget.orderDetailsRow?.orderStatus ?? '').tr,
                style: TextStyle(
                  color: MColors.colorPrimary,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  
                ),
              ),
            ],
          ),
          Gaps.vGap16,
          if (widget.orderDetailsRow?.orderStatus?.toLowerCase() !=
                  'canceled' ||
              widget.orderDetailsRow?.orderStatus?.toLowerCase() != 'returned')
            EasyStepper(
              lineLength: 70,
              lineSpace: 0,
              defaultLineColor: MColors.colorPrimaryLight,
              finishedLineColor: MColors.colorPrimary,
              activeStepTextColor: Colors.black87,
              finishedStepTextColor: MColors.colorPrimary,
              internalPadding: 0,
              showLoadingAnimation: false,
              stepRadius: 8,
              showStepBorder: false,
              lineThickness: 1.5,
              steps: [
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                          (widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'pending'
                              || widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'dispatched'
                              || widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'shipped'
                              || widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'delivered'
                          )
                              ? MColors.colorPrimary
                              : MColors.colorPrimaryLight,
                    ),
                  ),
                  title: 'pending'.tr,
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                        (widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'dispatched'
                            || widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'shipped'
                            || widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'delivered'
                        )
                              ? MColors.colorPrimary
                              : MColors.colorPrimaryLight,
                    ),
                  ),
                  title: 'dispatched'.tr,
                  topTitle: true,
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                          (widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'shipped'
                              || widget.orderDetailsRow?.orderStatus?.toLowerCase() == 'delivered'
                          )
                              ? MColors.colorPrimary
                              : MColors.colorPrimaryLight,
                    ),
                  ),
                  title: 'shipped'.tr,
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                          widget.orderDetailsRow?.orderStatus?.toLowerCase() ==
                                  'delivered'
                              ? MColors.colorPrimary
                              : MColors.colorPrimaryLight,
                    ),
                  ),
                  title: status = 'delivered'.tr,
                  topTitle: true,
                ),
              ],
              activeStep: activeStep,
            ),
        ],
      ),
    );
  }
}
