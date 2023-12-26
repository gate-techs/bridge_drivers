import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';
import '../../../../notifications/domain/notifications_repository.dart';
import '../../data/my_orders_response.dart';
import '../../domain/orders_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  OrdersRepository mOrdersRepository = OrdersRepository();

  Future<void> getOrdersCount() async {
    if (data != null) {
      data?.clear();
    }
    try {
      emit(HomeLoading());
      final mResponse = await mOrdersRepository.getOrdersCount();
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(HomeError(left));
      }, (right) async {
        await EasyLoading.dismiss();
        newOrdersCount = right.news ?? '0';
        totalOrdersCount = right.total ?? '0';
        getLastOrders();
      });
    } catch (e) {
      await EasyLoading.dismiss();
      if (data != null && data!.isEmpty) {
        emit(HomeError("empty_data".tr));
      }
      Log.e(e.toString());
    }
  }

  String newOrdersCount = '0';
  String totalOrdersCount = '0';

  int currentPageIndex = 1;
  bool isLastIndex = false;

  List<MyOrdersDataRows>? data = [];

  Future<void> getLastOrders({int pageIndex = 1}) async {
    try {
      if (pageIndex == 1) {
        emit(HomeLoading());
      }

      final mResponse = await mOrdersRepository.getOrdersData(status: OrdersStatus.all,
          pageIndex: pageIndex, paginate: 5);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(HomeError(left));
      }, (right) async {
        await EasyLoading.dismiss();

        if (right.length < 10) {
          isLastIndex = !isLastIndex;
        }
        data?.addAll(right);

        emit(HomeLoaded(data!));
      });
    } catch (e) {
      await EasyLoading.dismiss();
      if (data != null && data!.isEmpty) {
        emit(HomeError("empty_data".tr));
      }
      Log.e(e.toString());
    }
  }

  int badgeCount = 0;

  Future<void> getNotificationsCount() async {
    badgeCount = await NotificationsRepository()
        .getNotificationsCount()
        .then((value) async => value.fold((l) => l, (r) => r));
  }
}


