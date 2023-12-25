part of 'splash_cubit.dart';

@immutable
abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {}

class SplashSuccess extends SplashState{
  final VendorData splashData;

  const SplashSuccess(this.splashData);
}


class SplashFailed extends SplashState {
  final String message;

  const SplashFailed(this.message);
}