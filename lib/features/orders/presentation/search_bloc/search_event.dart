part of 'search_bloc.dart';

abstract class OrdersSearchEvent extends Equatable {
  const OrdersSearchEvent();
}

class GetOrdersDataEvent extends OrdersSearchEvent {
  final Map<String,dynamic> data;

  const GetOrdersDataEvent({required this.data});

  @override
  List<Object> get props => [data];
}