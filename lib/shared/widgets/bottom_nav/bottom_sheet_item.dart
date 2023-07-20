import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kishk_driver/common_utils/image_utils.dart';

class BottomSheetItem extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final Function tapCallBack;

  const BottomSheetItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.tapCallBack,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tapCallBack.call();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: SvgPicture.asset(
              ImageUtils.getSVGPath(icon),
              width: 24,
              height: 24,
             ),
          ),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
