part of 'about_cubit.dart';

@immutable
abstract class AboutState {
  const AboutState();
}

class AboutInitial extends AboutState {}


class AboutLoaded extends AboutState{
  final String aboutData;

  const  AboutLoaded(this.aboutData);
}



class AboutFailed extends AboutState {
  final String message;

  const AboutFailed(this.message);
}