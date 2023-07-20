import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/res/m_colors.dart';

import '../../../order_details/presentation/order_details_screen.dart';
import '../../data/notifications_response.dart';

class NotificationsListItem extends StatelessWidget {
  final NotificationsDataRows data;

  const NotificationsListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (data.userData != null && data.userData?.orderId != null) {
          await Get.to(() => OrderDetailsScreen(id: data.userData!.orderId!));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 15.0, right: 15.0, left: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: CommonUtils.getStatusColorFromId(
                          data.userData?.orderId.toString() ?? '1'),
                      width: 100,
                      height: 25,
                      alignment: Alignment.center,
                      child: Text(
                        data.userData?.status ?? '',
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, height: 1.8),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "clientName".tr,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    ' : ${data.userData?.clientName ?? ''}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    data.msg ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: MColors.moveColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    data.dateForHumans ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
