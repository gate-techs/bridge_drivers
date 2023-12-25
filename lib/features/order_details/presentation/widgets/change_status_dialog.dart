import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/res/m_colors.dart';

import '../../../../common_utils/log_utils.dart';

class ChangeStatusDialog extends StatelessWidget {
  final Function(OrdersStatus) onItemClickedCallBack;
  final String status;

  const ChangeStatusDialog({super.key, required this.onItemClickedCallBack, required this.status});

  @override
  Widget build(BuildContext context) {
    Log.e(status);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.back(result: {'refresh': true});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(30),
                      ),
                      color: MColors.colorPrimary,
                    ),
                    width: 60,
                    height: 50,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: mOrdersStatusList.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  if(mOrdersStatusList[index].name.tr!=status) {
                                    Navigator.pop(context);
                                    onItemClickedCallBack.call(mOrdersStatusList[index]);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  margin: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: mOrdersStatusList[index].name.tr!=status?Colors.white:MColors.colorPrimary,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black38)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                            mOrdersStatusList[index].name.tr,
                                            style: TextStyle(
                                                height: 2,
                                                fontWeight: FontWeight.w600,
                                              color: mOrdersStatusList[index].name.tr!=status?MColors.colorPrimary:Colors.white,),
                                            textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
