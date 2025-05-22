import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:research_hub/features/auth/domain/usecases/forgot_password_usecase.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  ForgotPasswordBloc(this._forgotPasswordUsecase)
    : super(ForgotPasswordInitial()) {
    on<ResetPasswordEvent>((event, emit) async {
      try {
        emit(ForgotPasswordLoading());
        await _forgotPasswordUsecase.call(email: event.email);
        emit(ForgotPasswordLoaded());
      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'invalid-email') {
          message = "User not found for that email!";
        } else {
          message = "Error occurred, Please try again!";
        }
        emit(ForgotPasswordError(errorMessage: message));
      } catch (e) {
        emit(ForgotPasswordError(errorMessage: e.toString()));
      }
    });
  }
}
