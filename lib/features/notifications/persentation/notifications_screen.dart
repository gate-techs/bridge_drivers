
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kishk_driver/features/notifications/persentation/widgets/no_notifcations_yet_widget.dart';
import 'package:kishk_driver/features/notifications/persentation/widgets/notifcation_item.dart';
import 'package:paginated_list/paginated_list.dart';

import '../../../common_utils/common_utils.dart';
import '../../../main.dart';
import '../../../res/m_colors.dart';

import '../../../shared/loading_widget.dart';
import '../../order_details_screen/presentation/order_details_screen.dart';
import '../data/notifications_entity.dart';
import 'cubit/notifications_cubit.dart';
import 'widgets/notification_permission_wdget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MColors.screensBackgroundColor,
        appBar: AppBar(
            titleSpacing: 0.0,
            title: Text(
              "notifications".tr,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            leading: BlocProvider<NotificationsCubit>(
              create: (_) => NotificationsCubit(),
              child: BlocConsumer<NotificationsCubit, NotificationsState>(
                  buildWhen: (previous, current) => previous != current,
                  listener: (context, state) {
                    if (state is SeeAllNotificationsSuccess) {
                      Get.back(result: {'refresh': true});
                    } else if (state is SeeAllNotificationsFailed) {}
                  },
                  builder: (context, state) {
                    return IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {
                        NotificationsCubit().seeNotifications();
                        Get.back(result: {'refresh': true});
                      },
                    );
                  }),
            )),
        body: BlocProvider(
          create: (context) => NotificationsCubit()..getNotifications({'paginate':30}),
          child: BlocConsumer<NotificationsCubit, NotificationsState>(
            listener: (context, state) {},
            builder: (context, state) {
              NotificationsCubit mNotificationsCubit =
                  NotificationsCubit.get(context);

              if (mNotificationsCubit.isNotify) {
                if (state is NotificationsLoaded) {
                  final data = state.notifications;
                  return Scaffold(
                    backgroundColor: MColors.screensBackgroundColor,
                    body: RefreshIndicator(
                        onRefresh: () async {
                          mNotificationsCubit.notificationsList.clear();
                          mNotificationsCubit.isLastPage = false;
                          mNotificationsCubit.currentPageIndex = 1;
                          mNotificationsCubit.getNotifications({'paginate':30});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                  PaginatedList<NotificationsDataRows>(
                                      loadingIndicator: const LoadingWidget(),
                                      shrinkWrap: true,
                                      items: data,
                                      isRecentSearch: false,
                                      isLastPage: mNotificationsCubit.isLastPage,
                                      onLoadMore: (index) {
                                        if (mNotificationsCubit.currentPageIndex != mNotificationsCubit.lastPage) {
                                          mNotificationsCubit.getNotifications({
                                            'paginate':30,
                                            'page': (++mNotificationsCubit
                                                .currentPageIndex)
                                                .toString()
                                          });
                                        }
                                      },
                                      builder: (NotificationsDataRows e,
                                          int index) {
                                        return InkWell(
                                          onTap: () async{
                                            var res = await Get.to(() =>  OrderDetailsScreen(id: e.modelId.toString(),));
                                            if (res['refresh'] == true) {
                                              mNotificationsCubit.notificationsList.clear();
                                              mNotificationsCubit.isLastPage = false;
                                              mNotificationsCubit.currentPageIndex = 1;
                                              mNotificationsCubit.getNotifications({'paginate':30});
                                            }
                                          },
                                          child: NotificationItem(
                                            notificationsListDataRows:
                                            e,
                                          ),
                                        );
                                      })
                                ],
                          )),
                        )),
                  );
                } else if (state is NotificationsFailed) {
                  return const NoNotificationsYet();
                } else {
                  return const LoadingWidget();
                }
              } else {
                return NotificationsPermissionWidget(
                  callBack: (bool isGranted) {
                    if (isGranted) {
                      mNotificationsCubit.notificationsList.clear();
                      mNotificationsCubit.isLastPage = false;
                      mNotificationsCubit.currentPageIndex = 1;
                      mNotificationsCubit.getNotifications({'paginate':30});
                    }
                  },
                );
              }
            },
          ),
        ));
  }
}
