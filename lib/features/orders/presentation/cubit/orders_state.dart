part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {
  const OrdersState();
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<MyOrdersDataRows> mDataList;

  const OrdersLoaded(this.mDataList);
}

class OrdersError extends OrdersState {
  final String message;

  const OrdersError(this.message);
}
