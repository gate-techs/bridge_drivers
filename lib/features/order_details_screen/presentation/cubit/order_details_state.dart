part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {
  const OrderDetailsState();
}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoaded extends OrderDetailsState{
  final OrderDetailsDataRow orderDetails;

  const OrderDetailsLoaded(this.orderDetails);
}


class OrderDetailsFailed extends OrderDetailsState {
  final String message;

  const OrderDetailsFailed(this.message);
}