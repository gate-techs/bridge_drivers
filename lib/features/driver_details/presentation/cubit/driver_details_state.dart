part of 'driver_details_cubit.dart';

@immutable
abstract class DriverDetailsState {
  const DriverDetailsState();
}

class DriverDetailsInitial extends DriverDetailsState {}


class DriverDetailsLoading extends DriverDetailsState {}

class DriverDetailsLoaded extends DriverDetailsState {
  final List<DriverDetailsDataRows> dataList;

  const DriverDetailsLoaded(this.dataList);
}

class DriverDetailsError extends DriverDetailsState {
  final String message;

  const DriverDetailsError(this.message);
}