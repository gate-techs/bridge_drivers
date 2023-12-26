import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/image_loader.dart';
import 'package:kishk_driver/res/gaps.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/app_loading_widget.dart';
import 'package:kishk_driver/shared/widgets/empty_data_widget.dart';

import 'cubit/product_details_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('order_details'.tr,
            style:  TextStyle(
                color: MColors.colorPrimary, fontFamily: 'Tajawal')),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child:  Icon(
              Icons.arrow_back_ios,
              color: MColors.colorPrimary,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => ProductDetailsCubit()..getProductDetailsData(id),
          child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              ProductDetailsCubit mProductDetailsCubit =
                  ProductDetailsCubit.get(context);

              if (state is ProductDetailsLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: state.data.galleries?.map((item) {
                          return ImageLoader.loadDefaultWithPlaceHolder(
                              item.image,
                              height: 350,
                              fit: BoxFit.fill);
                        }).toList(),
                        options: CarouselOptions(
                          height: 350,
                          disableCenter: true,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                          enlargeCenterPage: false,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) =>
                              mProductDetailsCubit.updateSliderIndex(index),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            state.data.galleries?.length ?? 0,
                            (int index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration:  BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: MColors.colorPrimary,
                              ),
                              margin: const EdgeInsets.only(right: 5),
                              height: 5,
                              curve: Curves.easeIn,
                              width: mProductDetailsCubit.sliderIndex == index
                                  ? 15
                                  : 5,
                            ),
                          ),
                        ),
                      ),
                      Gaps.vGap16,
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 14),
                        child: Text(
                          '${"price".tr} ${state.data.price.toString()} ${"kwd".tr} ',
                          style:  TextStyle(
                              color: MColors.colorPrimary,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Franklin'),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      if (state.data.attributes?.colors != null &&
                          state.data.attributes!.colors!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'color'.tr,
                                style:  TextStyle(
                                    color: MColors.colorPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Franklin'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    state.data.attributes?.colors?.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:  CommonUtils.getColorFromHex(
                                        state.data.attributes?.colors?[index].hex ??"#6A1580"),
                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        border: Border.all(color: (state.data.attributes?.colors?[index].hex != "#ffffff" && state.data.attributes?.colors?[index].hex != "#FFFFFF")
                                            ? CommonUtils.getColorFromHex(state
                                            .data
                                            .attributes
                                            ?.colors?[index]
                                            .hex ??
                                            "#6A1580")
                                            : Colors.black,width: 4)),
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.all(2.0),

                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      if (state.data.attributes?.sizes != null &&
                          state.data.attributes!.sizes!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('size'.tr,
                                  style:  TextStyle(
                                      color: MColors.colorPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Franklin')),
                            ),
                            SizedBox(
                              height: 20,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.data.attributes?.sizes?.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    state.data.attributes?.sizes?[index]
                                            .attribute
                                            ?.toUpperCase() ??
                                        '',
                                    style:
                                        const TextStyle(fontFamily: 'Tajawal'),
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      ExpansionTile(
                        title: Text(
                          "product_info".tr,
                          style:  TextStyle(
                              color: MColors.colorPrimary,
                              fontWeight: FontWeight.bold,
                              height: 2,
                              fontFamily: 'Franklin'),
                        ),
                        children: [Text(state.data.body ?? '')],
                      ),
                      Gaps.vGap30,
                    ],
                  ),
                );
              } else if (state is ProductDetailsError) {
                return  EmptyDataWidget(onRefreshClicked: (){
                  mProductDetailsCubit.getProductDetailsData(id);
                },);
              } else {
                return const AppLoadingWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
