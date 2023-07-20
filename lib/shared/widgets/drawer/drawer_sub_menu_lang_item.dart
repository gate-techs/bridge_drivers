import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kishk_driver/common_utils/image_utils.dart';
import 'package:kishk_driver/res/m_colors.dart';

class DrawerSubMenuLanguageItem extends StatelessWidget {
  final Function callback;
  final String name;
  final bool isChecked;

  const DrawerSubMenuLanguageItem(
      {Key? key,
      required this.callback,
      required this.name,
      required this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback.call(),
      child: Container(
        margin: const EdgeInsetsDirectional.only(
          start: 7,
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              name,
              style: TextStyle(
                color:
                    isChecked ? MColors.colorPrimary : const Color(0xff6c7b8a),
                fontSize: 15,
                fontWeight: isChecked ? FontWeight.bold : FontWeight.w500,
                fontFamily: 'Tajawal',
              ),
            ),
            const Spacer(),
            Visibility(
              visible: isChecked,
              child: SvgPicture.asset(
                ImageUtils.getSVGPath('ic_lang_checked'),
                width: 6,
                height: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
