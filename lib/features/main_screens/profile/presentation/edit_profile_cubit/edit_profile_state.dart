part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {
  const EditProfileState();
}

class EditProfileInitial extends EditProfileState {}


class EditProfileSuccess extends EditProfileState{
  final String message;

  const EditProfileSuccess(this.message);
}


class EditProfileFailed extends EditProfileState {
  final String message;

  const EditProfileFailed(this.message);
}



