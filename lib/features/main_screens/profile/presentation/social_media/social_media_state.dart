part of 'social_media_cubit.dart';

@immutable
abstract class SocialMediaState {}

class SocialMediaInitial extends SocialMediaState {}

class SocialMediaLoading extends SocialMediaState {}

class SocialMediaLoaded extends SocialMediaState {
  final List<PaymentMethods>? data;

  SocialMediaLoaded(this.data);
}

class SocialMediaError extends SocialMediaState {}