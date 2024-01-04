part of 'search_bloc.dart';

abstract class DriversSearchEvent extends Equatable {
  const DriversSearchEvent();
}

class GetDriversDataEvent extends DriversSearchEvent {
  final Map<String,dynamic> data;

  const GetDriversDataEvent({required this.data});

  @override
  List<Object> get props => [data];
}