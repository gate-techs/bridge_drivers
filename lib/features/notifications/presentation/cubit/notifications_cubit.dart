import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kishk_driver/common_utils/common_utils.dart';
import 'package:kishk_driver/common_utils/log_utils.dart';

import '../../data/notifications_response.dart';
import '../../domain/notifications_repository.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  NotificationsRepository mNotificationsRepository = NotificationsRepository();

  int currentPageIndex = 1;
  bool isLastIndex = false;

  List<NotificationsDataRows>? data = [];

  Future<void> getLastNotifications({int pageIndex = 1}) async {
    try {
      if (pageIndex == 1) {
        emit(NotificationsLoading());
      }

      final mResponse = await mNotificationsRepository.getNotificationsData(
          pageIndex: pageIndex);
      mResponse.fold((left) async {
        await EasyLoading.dismiss();
        CommonUtils.showToastMessage(left);
        emit(NotificationsError(left));
      }, (right) async {
        await EasyLoading.dismiss();

        if (right.length < 10) {
          isLastIndex = !isLastIndex;
        }
        data?.addAll(right);

        emit(NotificationsLoaded(data!));
      });
    } catch (e) {
      await EasyLoading.dismiss();
      if (data != null && data!.isEmpty) {
        emit(NotificationsError("empty_data".tr));
      }
      Log.e(e.toString());
    }
  }
}
