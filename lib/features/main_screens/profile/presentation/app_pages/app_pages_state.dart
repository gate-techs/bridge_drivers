part of 'app_pages_cubit.dart';

@immutable
abstract class AppPagesState {}

class AppPagesInitial extends AppPagesState {}

class AppPagesLoading extends AppPagesState {}

class AppPagesLoaded extends AppPagesState {
  final List<AppPagesDataRows>? data;

  AppPagesLoaded(this.data);
}

class AppPagesError extends AppPagesState {}
