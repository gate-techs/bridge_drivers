import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../helpers/notifications_helper/notifications_helper.dart';
import '../../data/notifications_entity.dart';
import '../../domain/notifications_repository.dart';
import '../../domain/see_notifications_repository.dart';


part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  bool isLastPage = false;
  int currentPageIndex = 1;
  int lastPage = 10;
  int listTotal = 0;

  List<NotificationsDataRows> notificationsList = [];

  NotificationsRepository notificationsRepository = NotificationsRepository();
  bool isNotify = true;

  Future<void> getNotifications(Map<String, dynamic> prams) async {
    if (currentPageIndex == 1) {
      emit(NotificationsLoading());
    }
    final resul = await notificationsRepository.getNotifications(prams);
    isNotify = await NotificationsHelper.checkNotificationPermission();
    resul.fold((l) {
      emit(NotificationsFailed("empty_data".tr));
    }, (r) {
      final List<NotificationsDataRows> fetchedPosts = r.data?.rows ?? [];
      lastPage = r.data?.paginate?.lastPage ?? 1;
      listTotal = r.data?.paginate?.total ?? 0;
      if (r.data == null || r.data!.rows!.isEmpty) {
        emit(NotificationsFailed("empty_data".tr));
      } else {
        if (currentPageIndex == r.data!.paginate!.lastPage) {
          isLastPage = true;
        }
        if (fetchedPosts.isNotEmpty) {
          notificationsList.addAll(fetchedPosts);
          fetchedPosts.clear();
          emit(NotificationsLoaded(notificationsList));
        }
      }
    });
  }

  SeeNotificationsRepository seeNotificationsRepository =
      SeeNotificationsRepository();

  Future<void> seeNotifications() async {
    final resul = await seeNotificationsRepository.seeNotifications();
    resul.fold((l) {
      emit(SeeAllNotificationsFailed(l));
    }, (r) {
      emit(SeeAllNotificationsSuccess(r));
    });
  }
}
