import 'package:flutter/material.dart';

import '../../../../common_utils/common_utils.dart';
import '../../../../common_utils/image_loader.dart';
import '../../../../main.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../data/notifications_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notificationsListDataRows})
      : super(key: key);
  final NotificationsDataRows? notificationsListDataRows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      margin: const EdgeInsets.symmetric(vertical: 1),
      color: notificationsListDataRows?.seen == false ?
      MColors.colorPrimaryLight : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  child: ImageLoader.loadDefaultWithPlaceHolder(
                      notificationsListDataRows?.media?.url ?? '',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover),
                ),
                Gaps.hGap10,
                SizedBox(
                  width:CommonUtils.getISTablet(context)?380: 160,
                  child: Text(
                    notificationsListDataRows?.title ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines:3,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                notificationsListDataRows?.diffForHumans ?? '',
                style: TextStyle(
                  color: MColors.colorSecondaryDark,
                  fontSize: 14,
                  fontFamily: appFontFamily,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
