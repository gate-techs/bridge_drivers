import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../common_utils/common_utils.dart';
import '../../data/order_details_entity.dart';
import '../../domain/change_order_status_repository.dart';
import '../../domain/order_details_repository.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  static OrderDetailsCubit get(context) => BlocProvider.of(context);


  OrderDetailsRepository orderDetailsRepository = OrderDetailsRepository();

  ExpansionTileController expansionTileController =ExpansionTileController();

  bool isRefresh = false;


  Future<void> getOrderDetails(String id) async {
    if (isRefresh==true) {
      emit(OrderDetailsLoading());
    }
    final resul = await orderDetailsRepository.getOrderDetails(id);

    resul.fold((l) {
      emit(OrderDetailsFailed("empty_data".tr));
    }, (r) {
      if (r.data?.row == null) {
        emit(OrderDetailsFailed("empty_data".tr));
      }
      else {
        emit(OrderDetailsLoaded(r.data!.row!));
      }
    });
  }




  ChangeOrderStatusRepository changeOrderStatusRepository= ChangeOrderStatusRepository();


  Future<void> changeOrderStatus(String orderId, String status, String shoppingCartId,) async {
    try {
        final mResponse = await changeOrderStatusRepository.changeOrderStatus(status,shoppingCartId);
        mResponse.fold((left) async {
          CommonUtils.showToastMessage(left);
        },
        (right) async {
          isRefresh =true;
          CommonUtils.showToastMessage(right);
        });
     } catch (e) {
      await EasyLoading.dismiss();
      CommonUtils.showToastMessage(e.toString(), status: 'rejected');
    }
  }


}
