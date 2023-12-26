part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {
  const OrdersState();
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState{
  final List<OrdersDataRows> orders;

  const OrdersLoaded(this.orders);
}

class OrdersFailed extends OrdersState {
  final String message;

  const OrdersFailed(this.message);
}
