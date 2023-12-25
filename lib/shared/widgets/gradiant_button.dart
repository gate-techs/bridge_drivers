import 'package:flutter/material.dart';
import 'package:kishk_driver/res/m_colors.dart';

Widget gradientButton(
    String title, BuildContext context, void Function() function) {
  return Center(
    child: InkWell(
        onTap: () => function.call(),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: MColors.colorPrimary,
            ),
            color: MColors.colorPrimary,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Tajawal"),
            ),
          ),
        )),
  );
}
