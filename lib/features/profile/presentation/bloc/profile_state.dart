part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {}

final class ProfileLoggedOut extends ProfileState {}

final class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError({required this.errorMessage});
}

final class PasswordLoading extends ProfileState{}

final class PasswordError extends ProfileState {
  final String errorMessage;

  PasswordError({required this.errorMessage});

}

final class PasswordUpdated extends ProfileState {}
