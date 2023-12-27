import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../data/order_details_entity.dart';
import '../../domain/order_details_repository.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  static OrderDetailsCubit get(context) => BlocProvider.of(context);


  OrderDetailsRepository orderDetailsRepository = OrderDetailsRepository();

  Future<void> getOrderDetails(String id) async {
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




}
