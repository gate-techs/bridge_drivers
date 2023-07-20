part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {
  const EditProfileState();
}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileLoaded extends EditProfileState {
  final MyProfileData myProfileData;

  const EditProfileLoaded(this.myProfileData);
}

class EditProfileError extends EditProfileState {
  final String message;

  const EditProfileError(this.message);
}
