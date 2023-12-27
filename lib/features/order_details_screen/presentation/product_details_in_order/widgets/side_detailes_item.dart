import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../res/m_colors.dart';
import '../../../../product_details/data/product_details_entity.dart';




class SideDetailsItem extends StatelessWidget {
  const SideDetailsItem({Key? key, required this.attributesReadOnly, required this.attributesReadOnlyLength,}) : super(key: key);
  final ProductDetailsDataRowAttributesReadOnly attributesReadOnly;
  final int attributesReadOnlyLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: MColors.colorSideDetails,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      width: 200.w,
      height: 80.h,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            // ClipOval(
            //   child: Container(
            //     color: Colors.white,
            //     padding: const EdgeInsets.all(8),
            //     child: Image.network(icon??'', height: 25,width: 25,),
            //   ),
            // ),
            // Gaps.hGap10,

            SizedBox(
              width: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: attributesReadOnlyLength,
                itemBuilder: (context, i) {
                  return    SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text(attributesReadOnly.title??'',style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        if(attributesReadOnly.childs!.isNotEmpty)
                        Text(attributesReadOnly.childs?[i].title??'',style: TextStyle(color: MColors.colorPrimaryDark),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}
