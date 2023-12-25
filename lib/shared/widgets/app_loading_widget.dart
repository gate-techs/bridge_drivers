import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/res/m_colors.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SpinKitFadingGrid(
            color: MColors.colorPrimary,
            size: 50,
          ),
          const SizedBox(
            height: 8,
          ),
          Text('loading'.tr)
        ],
      ),
    );
  }
}
