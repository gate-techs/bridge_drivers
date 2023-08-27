import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/image_loader.dart';
import 'package:kishk_driver/res/gaps.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/app_loading_widget.dart';
import 'package:kishk_driver/shared/widgets/empty_data_widget.dart';

import '../../product_details/presentation/product_details_screen.dart';
import 'cubit/order_details_cubit.dart';
import 'widgets/change_status_dialog.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit()..getOrderDetailsData(id),
      child: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          OrderDetailsCubit mOrderDetailsCubit = OrderDetailsCubit.get(context);

          if (state is OrderDetailsLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text('order_details'.tr,
                    style: const TextStyle(
                        color: MColors.colorPrimary, fontFamily: 'Tajawal')),
                centerTitle: true,
                leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: MColors.colorPrimary,
                    )),
                actions: [
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => ChangeStatusDialog(
                                  onItemClickedCallBack: (OrdersStatus status) {
                                    mOrderDetailsCubit.updateOrderStatus(
                                        id, status);
                                  },
                                ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Icon(Icons.delivery_dining_outlined,
                            size: 36, color: MColors.colorPrimary),
                      )),
                ],
              ),
              body: Column(
                children: [
                  ExpansionTile(title: Text('clientInfo'.tr), children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Text(
                            "name".tr,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ' : ${state.data.row?.name ?? ''}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Text(
                            "phone".tr,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ' : ${state.data.row?.mobile ?? ''}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                                onTap: () {
                                  CommonUtils.whatsappMessage(
                                      state.data.row?.mobile ?? '', '');
                                },
                                child: const Icon(FontAwesomeIcons.whatsapp)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                                onTap: () {
                                  CommonUtils.makePhoneCall(
                                      state.data.row?.mobile ?? '');
                                },
                                child: const Icon(Icons.call)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Text(
                            "address".tr,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ' : ${state.data.row?.address ?? ''}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Gaps.vGap8,
                  Expanded(
                    child: AnimatedList(
                      key: mOrderDetailsCubit.listKey,
                      initialItemCount: state.data.row?.carts?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index, animation) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                id: state.data.row!.carts![index].productId!));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: MColors.blueColor)),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 150,
                                  height: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:
                                        ImageLoader.loadDefaultWithPlaceHolder(
                                            state.data.row?.carts?[index]
                                                    .image ??
                                                '',
                                            width: 150,
                                            height: 120,
                                            fit: BoxFit.fill),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          '${state.data.row?.carts?[index].title}',
                                          maxLines: 3,
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Tajawal'),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${'qty'.tr}  ${state.data.row?.carts?[index].qty}',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'Tajawal'),
                                          ),
                                          Text(
                                            '${'price'.tr} ${state.data.row?.carts?[index].price}',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'Tajawal'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: MColors.sectionBg),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "total_price".tr,
                                style: const TextStyle(
                                    fontSize: 18, color: MColors.moveColor),
                              ),
                              Text(
                                "'${state.data.row?.totalPrice}' ${"kwd".tr}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: MColors.moveColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is OrderDetailsError) {
            return const EmptyDataWidget();
          } else {
            return const AppLoadingWidget();
          }
        },
      ),
    );
  }
}
