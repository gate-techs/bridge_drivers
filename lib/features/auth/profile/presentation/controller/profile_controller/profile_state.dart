part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileData profileData;

  const ProfileLoaded(this.profileData);
}

class ProfileFailed extends ProfileState {
  final String message;

  const ProfileFailed(this.message);
}
