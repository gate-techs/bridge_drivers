import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/res/gaps.dart';
import 'package:kishk_driver/res/m_colors.dart';

class EmptyDataWidget extends StatelessWidget {
  final Function? onRefreshClicked;

  const EmptyDataWidget({Key? key, this.onRefreshClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefreshClicked?.call(),
      child: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .15),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 120,
                height: 120,
              ),
              Gaps.vGap16,
              Text('empty_data'.tr),
              Gaps.vGap16,
              Text(
                'pull_to_refresh'.tr,
                style: const TextStyle(
                    color: MColors.colorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
