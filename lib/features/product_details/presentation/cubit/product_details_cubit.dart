 import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';
import 'package:kishk_driver/features/product_details/data/product_details_response.dart';

import '../../domain/product_details_repository.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsRepository mProductDetailsRepository =
      ProductDetailsRepository();

  ProductDetailsDataRows? data;

  Future<void> getProductDetailsData(int id) async {
    try {
      emit(ProductDetailsLoading());

      final mResponse =
          await mProductDetailsRepository.getProductDetailsData(id);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(ProductDetailsError(left));
      }, (right) async {
        await EasyLoading.dismiss();
        right.galleries
          ?..add(Galleries(image: right.image))
          ..reversed;
        data = right;
        emit(ProductDetailsLoaded(right));
      });
    } catch (e) {
      await EasyLoading.dismiss();

      emit(ProductDetailsError("empty_data".tr));

      Log.e(e.toString());
    }
  }

  int sliderIndex = 0;

  void updateSliderIndex(int index) {
    sliderIndex = index;
    emit(ProductDetailsLoaded(data!));
  }
}
