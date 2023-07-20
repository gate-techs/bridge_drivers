part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {
  const OrderDetailsState();
}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsLoaded extends OrderDetailsState {
  final OrderDetailsData data;

  const OrderDetailsLoaded(this.data);
}

class OrderDetailsError extends OrderDetailsState {
  final String message;

  const OrderDetailsError(this.message);
}
