import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';

import '../../../home/data/my_orders_response.dart';
import '../../../home/domain/orders_repository.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(context) => BlocProvider.of(context);

  OrdersRepository mOrdersRepository = OrdersRepository();

  TextEditingController searchController = TextEditingController();

  void resetListConfig() {
    currentPageIndex = 1;
    isLastIndex = false;
    data?.clear();
  }

  int currentPageIndex = 1;
  bool isLastIndex = false;

  List<MyOrdersDataRows>? data = [];
  int totalLength = 0;

  Future<void> getLastOrders(
      {int pageIndex = 1,
      required OrdersStatus status,
      String searchKeyWord=''}) async {
    try {
      if (pageIndex == 1) {
        emit(OrdersLoading());
      }

      final mResponse = await mOrdersRepository.getOrdersData(
          pageIndex: pageIndex, status: status,searchKeyWord: searchKeyWord);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(OrdersError(left));
      }, (right) async {
        await EasyLoading.dismiss();

        if (right.length < 10) {
          isLastIndex = !isLastIndex;
        }
        data?.addAll(right);
        totalLength = data?.length ?? 0;

        emit(OrdersLoaded(data!));
      });
    } catch (e) {
      await EasyLoading.dismiss();
      if (data != null && data!.isEmpty) {
        emit(OrdersError("empty_data".tr));
      }
      Log.e(e.toString());
    }
  }
}
