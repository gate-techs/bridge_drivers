import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:paginated_list/paginated_list.dart';
import 'package:kishk_driver/res/m_colors.dart';
import 'package:kishk_driver/shared/widgets/app_loading_widget.dart';
import 'package:kishk_driver/shared/widgets/empty_data_widget.dart';

import '../data/notifications_response.dart';
import 'cubit/notifications_cubit.dart';
import 'widgets/notifications_list_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'.tr,
            style: const TextStyle(
                color: MColors.colorPrimary, fontFamily: 'Tajawal')),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: MColors.colorPrimary,
            )),
      ),
      body: BlocProvider(
        create: (context) => NotificationsCubit()..getLastNotifications(),
        child: BlocConsumer<NotificationsCubit, NotificationsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            NotificationsCubit mNotificationsCubit =
                NotificationsCubit.get(context);
            if (state is NotificationsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    mNotificationsCubit.getLastNotifications();
                  },
                  child: PaginatedList<NotificationsDataRows>(
                    loadingIndicator: const AppLoadingWidget(),
                    shrinkWrap: true,
                    items: state.mDataList,
                    isRecentSearch: false,
                    isLastPage: mNotificationsCubit.isLastIndex,
                    onLoadMore: (int index) {
                      if (!mNotificationsCubit.isLastIndex) {
                        mNotificationsCubit.getLastNotifications(
                            pageIndex: ++mNotificationsCubit.currentPageIndex);
                      }
                    },
                    builder: (e, index) =>
                        NotificationsListItem(data: state.mDataList[index]),
                  ),
                ),
              );
            } else if (state is NotificationsError) {
              return const EmptyDataWidget();
            } else {
              return const AppLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
