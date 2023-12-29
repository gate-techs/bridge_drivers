import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import '../../../../../main.dart';
import '../../../../common_utils/image_utils.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../data/drivers_entity.dart';

class DriversItem extends StatelessWidget {
  const DriversItem({super.key, required this.driversItemDataRows});

  final DriversDataRows driversItemDataRows;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 6),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${'name'.tr } : ${ driversItemDataRows.name ?? ' '}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.vGap8,
                  Text(
                    '${'totalOrder'.tr }: ${ driversItemDataRows.totalOrders ?? ''}',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      CommonUtils.makePhoneCall(driversItemDataRows.mobile ?? '');
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
                  Gaps.vGap8,
                  Text(
                  driversItemDataRows.mobile??'',
                    style: TextStyle(
                      fontSize: 14,
                      color:MColors.colorPrimary,
                      fontFamily: appFontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

