import 'package:flutter/material.dart';

import '../../main.dart';


class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key, required this.title,});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
          style: TextStyle(color: Colors.black,fontSize: 12, fontFamily: appFontFamily),)
        ],
      ),
    );
  }
}
