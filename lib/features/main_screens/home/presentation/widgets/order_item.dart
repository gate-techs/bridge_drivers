import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common_utils/log_utils.dart';
import '../../../../order_details_screen/presentation/order_details_screen.dart';
import '../../data/orders_entity.dart';

class OrderListItem extends StatelessWidget {
  final OrdersDataRows data;
  final Function() refreshCallBack;

  const OrderListItem(
      {super.key, required this.data, required this.refreshCallBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final res = await Get.to(() => OrderDetailsScreen(id: data.id!.toString()));
        if (res != null && res['refresh'] == true) {
          refreshCallBack.call();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 0,
            )
          ],
        ),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildCodeAndPrice(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, right: 15.0, left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                      color:data.orderStatus=='pending'?Colors.red:Colors.white,
                        width: 100,
                        height: 30,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            data.orderStatus?.toLowerCase().tr ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              height: 2
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        data.orderedDate ?? '',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildCodeAndPrice(BuildContext context) {
    Log.e(data.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "name".tr,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              ' : ${data.customer?.name??''}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "code".tr,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              ' ${data.orderNo}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              "price".tr,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "${data.totalGrandPrice ?? ''} ${"kwd".tr}",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
