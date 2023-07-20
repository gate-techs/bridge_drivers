import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kishk_driver/common_utils/image_utils.dart';
import 'package:kishk_driver/res/gaps.dart';
 

class DrawerItem extends StatelessWidget {
  final Function callback;
  final String icon;
  final String name;

  const DrawerItem({Key? key,
    required this.callback,
    required this.icon,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback.call(),
      child: Container(
        margin: const EdgeInsetsDirectional.only(
          start: 6 ,
        ),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: const Color(0xffE9EFFF),
                  borderRadius: BorderRadius.circular(8)),
              child: SvgPicture.asset(
                ImageUtils.getSVGPath(icon),
                 width: 24,
                height: 24,
              ),
            ),
            Gaps.hGap8,
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
