import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';

import '../../data/order_details_response.dart';
import '../../domain/order_details_repository.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());

  static OrderDetailsCubit get(context) => BlocProvider.of(context);

  final listKey = GlobalKey<AnimatedListState>();

  OrderDetailsRepository mOrderDetailsRepository = OrderDetailsRepository();

  Future<void> getOrderDetailsData(int id) async {
    try {
      emit(OrderDetailsLoading());

      final mResponse = await mOrderDetailsRepository.getOrderDetailsData(id);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(OrderDetailsError(left));
      }, (right) async {
        await EasyLoading.dismiss();
        emit(OrderDetailsLoaded(right));
      });
    } catch (e) {
      await EasyLoading.dismiss();

      emit(OrderDetailsError("empty_data".tr));

      Log.e(e.toString());
    }
  }

  Future<void> updateOrderStatus(int id, OrdersStatus status) async {
    await EasyLoading.show(status: 'loading'.tr);

    try {
      final mResponse =
          await mOrderDetailsRepository.updateOrderStatusData(id, status);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(OrderDetailsError(left));
      }, (right) async {
        await EasyLoading.dismiss();
        Get.back(result: {'refresh': true});
        // emit(OrderDetailsLoaded(right));
      });
    } catch (e, s) {
      await EasyLoading.dismiss();

      emit(OrderDetailsError("empty_data".tr));

      Log.e('$e $s');
    }
  }
}
