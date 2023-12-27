import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../main.dart';

class TwoTextRow extends StatelessWidget {
  const TwoTextRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:   TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: appFontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              value.toString(),
              style:   TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text('KWD'.tr ,
              style:   TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
