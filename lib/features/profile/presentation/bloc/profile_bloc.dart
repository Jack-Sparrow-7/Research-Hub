import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:research_hub/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:research_hub/features/profile/domain/usecases/logout_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final LogoutUsecase _logoutUsecase;
  final ChangePasswordUsecase _changePasswordUsecase;
  ProfileBloc(this._logoutUsecase, this._changePasswordUsecase)
    : super(ProfileInitial()) {
    on<LogoutRequested>((event, emit) async {
      try {
        await _logoutUsecase.call();
        emit(ProfileLoggedOut());
      } on FirebaseAuthException catch (e) {
        emit(ProfileError(errorMessage: e.message ?? "Authentication error"));
      } catch (e) {
        emit(ProfileError(errorMessage: "Something went wrong. Try again."));
      }
    });

    on<UpdatePassword>((event, emit) async {
      try {
        emit(PasswordLoading());
        if (event.newPassword != event.confirmNewPassword) {
          emit(
            PasswordError(
              errorMessage: "New Password and Confirm Password must Match!",
            ),
          );
          return;
        }
        if (event.newPassword.length < 6) {
          emit(
            PasswordError(
              errorMessage: "Password must be at least 6 characters long.",
            ),
          );
          return;
        }
        await _changePasswordUsecase.call(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword,
        );
        emit(PasswordUpdated());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          emit(PasswordError(errorMessage: "Current password is incorrect."));
        } else {
          debugPrint(e.toString());
          emit(PasswordError(errorMessage: "Something went wrong"));
        }
      } catch (e) {
        emit(PasswordError(errorMessage: "An unexpected error occurred."));
      }
    });
  }
}
