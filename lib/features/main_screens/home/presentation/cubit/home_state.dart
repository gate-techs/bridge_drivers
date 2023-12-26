part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MyOrdersDataRows> mDataList;

  const HomeLoaded(this.mDataList);
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}
