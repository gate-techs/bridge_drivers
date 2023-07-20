part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {
  const LogoutState();
}

class LogoutInitial extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final String message;

  const LogoutSuccess(this.message);
}

class LogoutFailed extends LogoutState {
  final String message;

  const LogoutFailed(this.message);
}
