part of 'drivers_cubit.dart';

@immutable
abstract class DriversState {
  const DriversState();
}

class DriversInitial extends DriversState {}

class DriversLoading extends DriversState {}

class DriversLoaded extends DriversState{
  final List<DriversDataRows> drivers;

  const DriversLoaded(this.drivers);
}

class DriversFailed extends DriversState {
  final String message;

  const DriversFailed(this.message);
}