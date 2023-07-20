part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {
  const NotificationsState();
}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final List<NotificationsDataRows> mDataList;

  const NotificationsLoaded(this.mDataList);
}

class NotificationsError extends NotificationsState {
  final String message;

  const NotificationsError(this.message);
}
