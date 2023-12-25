part of 'main_cubit.dart';

@immutable
abstract class MainState {
  const MainState();
}

class MainInitial extends MainState {}

class MainUpdateIsServiceProvider extends MainState {
  final UserTypes userType;

  const MainUpdateIsServiceProvider(this.userType);
}
