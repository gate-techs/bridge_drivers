import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:meta/meta.dart';

import '../../../../common_utils/common_utils.dart';
import '../../data/drivers_entity.dart';
import '../../domain/assign_driver_repository.dart';
import '../../domain/drivers_repository.dart';

part 'drivers_state.dart';

class DriversCubit extends Cubit<DriversState> {
  DriversCubit() : super(DriversInitial());


  static DriversCubit get(context) => BlocProvider.of(context);

  final TextEditingController search = TextEditingController();
  int searchResults = 0;
  bool isLastPage = false;
  int currentPageIndex = 1;
  int lastPage = 10;
  int listTotal = 0;
  int radioSelected = 1;
  String categoryId = '1';

  List<DriversDataRows> driversList = [];

  DriversRepository driversRepository = DriversRepository();

  Future<void> getDrivers(Map<String, dynamic> prams) async {
    searchResults = 0;
    if (currentPageIndex == 1) {
      emit(DriversLoading());
    }
    final resul = await driversRepository.getDrivers(prams);
    resul.fold((l) {
      searchResults = 0;
      emit(DriversFailed("empty_data".tr));
    }, (r) {
      final List<DriversDataRows> fetchedPosts = r.data?.rows ?? [];
      lastPage = r.data?.paginate?.lastPage ?? 1;
      listTotal = r.data?.paginate?.total ?? 0;
      if (r.data == null || r.data!.rows!.isEmpty) {
        searchResults = 0;
        emit(DriversFailed("empty_data".tr));
      } else {
        if (currentPageIndex == r.data!.paginate!.lastPage) {
          isLastPage = true;
        }
        if (fetchedPosts.isNotEmpty) {
          driversList.addAll(fetchedPosts);
          fetchedPosts.clear();
          if (search.text.isNotEmpty) {
            searchResults = r.data?.paginate?.total ?? 0;
          } else {
            searchResults = 0;
          }
          emit(DriversLoaded(driversList));
        }
      }
    });
  }



  void getSearch(Map<String, dynamic> prams) async {
    emit( DriversInitial());
    final resul = await driversRepository.getDrivers(prams);

    resul.fold((l) {
      searchResults = 0;
      emit( DriversFailed(l));
    }, (r) {
      if (r.data == null || r.data!.rows!.isEmpty) {
        searchResults = 0;
        emit( DriversFailed("empty_data".tr));
      } else {
        if (search.text.isNotEmpty) {
          searchResults = r.data?.paginate?.total ?? 0;
        } else {
          searchResults = 0;
        }

        emit( DriversLoaded(r.data!.rows!));
      }
    });
  }





  AssignDriverRepository assignDriverRepository= AssignDriverRepository();


  Future<void> assignDriver(String orderId, String driverId) async {
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
          });
    } catch (e) {
      await EasyLoading.dismiss();
      CommonUtils.showToastMessage(e.toString(), status: 'rejected');
    }
  }
  
  
  
  
  
}
