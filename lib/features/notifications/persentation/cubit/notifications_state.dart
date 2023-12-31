part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {
  const NotificationsState();
}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}


class NotificationsLoaded extends NotificationsState{
  final List<NotificationsDataRows> notifications;

  const NotificationsLoaded(this.notifications);
}


class NotificationsFailed extends NotificationsState {
  final String message;

  const NotificationsFailed(this.message);
}

class SeeAllNotificationsSuccess extends NotificationsState{
  final String message;

  const SeeAllNotificationsSuccess(this.message);
}


class SeeAllNotificationsFailed extends NotificationsState {
  final String message;

  const SeeAllNotificationsFailed(this.message);
}