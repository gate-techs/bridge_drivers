import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/features/main_screens/drivers/data/drivers_entity.dart';
import 'package:kishk_driver/features/main_screens/drivers/domain/assign_driver_repository.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../domain/drivers_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

const duration = Duration(milliseconds: 1600);

EventTransformer<E> debounceSequential<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

@injectable
class DriversSearchBloc extends Bloc<DriversSearchEvent, DriversSearchState> {
  DriversSearchBloc() : super(const DriversSearchState()) {
    on<GetDriversDataEvent>(doSearch,
        transformer: debounceSequential(duration));
  }

  final DriversRepository driversRepository = DriversRepository();
  final TextEditingController search = TextEditingController();

  Future<void> doSearch(
      GetDriversDataEvent event,
    Emitter<DriversSearchState> emit,
  ) async {
    try {
      if (state.hasReachedMax) return;
      emit(state.copyWith(
          status: SearchStates.loading, searchKeyWord: event.data['search']));

      final resul = await driversRepository.getDrivers(event.data);
      resul.fold((l) {
        emit(state.copyWith(status: SearchStates.failed, errorMessage: l));
      }, (r) {
        emit(state.copyWith(
            status: SearchStates.success,
            data: r.data!.rows!,
            hasReachedMax: false));
      });
    } catch (e) {
      emit(state.copyWith(
          status: SearchStates.failed, errorMessage: 'empty_data'.tr));
    }
  }


  AssignDriverRepository assignDriverRepository= AssignDriverRepository();


  Future<void> assignDriver(int orderId, int driverId) async {
    try {
      EasyLoading.show();
      final mResponse = await assignDriverRepository.assignDriver(orderId, driverId);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
      }, (right) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(right);
        Get.back(result: {'refresh': true});
        Get.back(result: {'refresh': true});
        Get.back(result: {'refresh': true});
      });
    } catch (e) {
      await EasyLoading.dismiss();
      CommonUtils.showToastMessage(e.toString(), status: 'rejected');
    }
  }




}
