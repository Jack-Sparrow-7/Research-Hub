part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class LogoutRequested extends ProfileEvent {}

final class UpdateProfile extends ProfileEvent {
  final String displayName;
  final String photoUrl;

  UpdateProfile({required this.displayName, required this.photoUrl});
}

final class UpdatePassword extends ProfileEvent {
  final String currentPassword;
  final String newPassword;
  final String confirmNewPassword;

  UpdatePassword({required this.currentPassword, required this.newPassword, required this.confirmNewPassword});
}
