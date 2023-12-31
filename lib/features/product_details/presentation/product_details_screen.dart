import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/product_details/presentation/widgets/description_widget.dart';
import '../../../../res/gaps.dart';
import '../../../../res/m_colors.dart';
import '../../../common_utils/common_utils.dart';
import '../../../main.dart';
import '../../../shared/error_widget.dart';
import '../../../shared/loading_widget.dart';
import '../../../shared/rating_bar.dart';
import '../../order_details_screen/presentation/product_details_in_order/widgets/top_details_part.dart';
import 'cubit/poduct_details_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(
      {Key? key, required this.id, this.fromOnBoarding = false})
      : super(key: key);
  final String id;
  final bool? fromOnBoarding;
  static const String routeName = "/details_route_name";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..getProductDetails(widget.id),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductDetailsCubit mDetailsCubit = ProductDetailsCubit.get(context);
          if (state is ProductDetailsLoaded) {
            final data = state.productDetails;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                titleSpacing: 0.0,
                centerTitle: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: RefreshIndicator(
                backgroundColor: MColors.colorPrimaryLight,
                onRefresh: () async {
                  mDetailsCubit.isRefresh = true;
                  mDetailsCubit.getProductDetails(widget.id);
                },
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopDetailsPart(
                          productDetailsRow: data,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width * 0.8,
                                    child: AutoSizeText(
                                      data.title ?? '',
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  if (data.hasOffer == true)
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      width: 50,
                                      height: 30,
                                      child: Center(
                                          child: Text(
                                            '${data.offerPercentage ?? ''} %',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: appFontFamily,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${'brandName'.tr} : ${data.brand?.name ?? ''}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Gaps.vGap4,
                                        Text(
                                          '${'vendorPrice'.tr} : ${data.vendorPrice ?? ''}${'KWD'.tr}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: appFontFamily,
                                              fontSize: 14,
                                              color: MColors.colorPrimary
                                          ),
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),

                                  data.hasOffer == true
                                      ? Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${data.oldPrice ?? '0'} ${'KWD'.tr}',
                                        style: const TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                          TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Gaps.vGap4,
                                      Text(
                                        '${data.price ?? '0'} ${'KWD'.tr}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                      : Text(
                                    '${data.oldPrice ?? '0'} ${'KWD'.tr}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  StarRatingBar(
                                      score: double.parse(
                                          data.productRating.toString()),
                                      itemSize: 20),
                                ],
                              ),
                              Gaps.vGap10,
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return data.attributes![index].childs!.isNotEmpty
                                      ? Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(16)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      margin: const EdgeInsets.all(2.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                            const NeverScrollableScrollPhysics(),
                                            itemCount:
                                            data.attributes?.length,
                                            itemBuilder:
                                                (BuildContext context,
                                                int index) {
                                              return data.attributes![index]
                                                  .childs!.isNotEmpty
                                                  ? Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          16)),
                                                  padding:
                                                  const EdgeInsets.symmetric(vertical: 8.0),
                                                  margin: const EdgeInsets.all(2.0),
                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        data.attributes![index].title ?? '',
                                                        style:
                                                        const TextStyle(
                                                          color: Colors
                                                              .black,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 40,
                                                        child: ListView.builder(
                                                            scrollDirection: Axis.horizontal,
                                                            shrinkWrap:
                                                            true,
                                                            itemCount: data.attributes![index].childs?.length,
                                                            itemBuilder:
                                                                (context, i) {
                                                              return Container(
                                                                margin: const EdgeInsets
                                                                    .all(
                                                                    2),
                                                                width: (data.attributes![index].childs![i].title!.contains('#'))
                                                                    ? 100
                                                                    : 150,
                                                                decoration:
                                                                const BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(12),
                                                                  ),
                                                                ),
                                                                child:
                                                                Padding(
                                                                  padding:
                                                                  const EdgeInsets.all(1.0),
                                                                  child: (data.attributes![index].childs![i].title!.contains('#'))
                                                                      ? Container(
                                                                    height: 20,
                                                                    decoration: BoxDecoration(
                                                                        color: CommonUtils.getColorFromHex((data.attributes?[index].childs?[i].title ?? '' ).split('-').last),
                                                                        border: Border.all(color: Colors.grey,width: 0.5),
                                                                        borderRadius: const BorderRadius.all(Radius.circular(8))),
                                                                    width: 50,
                                                                  )
                                                                      : Container(
                                                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                                                    decoration: const BoxDecoration(
                                                                      color: Colors.white,
                                                                      borderRadius: BorderRadius.all(
                                                                        Radius.circular(12),
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                      data.attributes?[index].childs?[i].title ?? '',
                                                                      style: TextStyle(color: MColors.colorPrimary, fontSize: 16, fontWeight: FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      )
                                                    ],
                                                  ))
                                                  : const SizedBox();
                                            },
                                          ),
                                        ],
                                      ))
                                      : const SizedBox();
                                },
                              ),
                              Gaps.vGap10,
                              // data.body == null
                              //     ? Container()
                              //     :
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                                child: DescriptionWidget(
                                  productDetailsDataRow: data,
                                  productDetailsCubit: mDetailsCubit,
                                ),
                              ),

                              Column(
                                children: [
                                  Gaps.vGap16,
                                  ExpansionTile(
                                    tilePadding: EdgeInsets.zero,
                                    childrenPadding: EdgeInsets.zero,
                                    title: Text(
                                      'refundAndExchangePolicy'.tr,
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 16,
                                        fontFamily: appFontFamily,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('${'isRefundable'.tr} : ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: appFontFamily,
                                                      fontWeight: FontWeight.bold,
                                                    )),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                        data.vendor!.isRefundable ==
                                                            true
                                                            ? 'yes'.tr
                                                            : 'no'.tr,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                          appFontFamily,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Gaps.vGap8,
                                            if (data.vendor!.policy != null)
                                              Text(
                                                  '${'policy'.tr} : ${data.vendor!.policy ?? ''}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: appFontFamily,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                )),
              ),
            );
          } else if (state is ProductDetailsFailed) {
            return Scaffold(
              backgroundColor: MColors.screensBackgroundColor,
              appBar: AppBar(
                backgroundColor: MColors.screensBackgroundColor,
                titleSpacing: 0.0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: RefreshIndicator(
                backgroundColor: MColors.colorPrimaryLight,
                onRefresh: () async {
                  mDetailsCubit.isRefresh = true;
                  mDetailsCubit.getProductDetails(widget.id);
                },
                child: FailedWidget(
                  failedMessage: state.message,
                ),
              ),
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
