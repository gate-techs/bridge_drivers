part of 'about_cubit.dart';

@immutable
abstract class AboutState {
  const AboutState();
}

class AboutInitial extends AboutState {}

class AboutSuccess extends AboutState{
  final AboutData data;

  const AboutSuccess(this.data);
}


class AboutFailed extends AboutState {
  final String message;

  const AboutFailed(this.message);
}
