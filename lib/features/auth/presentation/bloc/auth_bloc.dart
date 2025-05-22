import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:research_hub/features/auth/domain/entities/user_enitity.dart';
import 'package:research_hub/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  AuthBloc(this._loginUsecase) : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      try {
        emit(AuthLoading());
        final user = await _loginUsecase.call(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated(user: user));
      } on FirebaseAuthException catch (e) {
        String message = "";
        if (e.code == 'invalid-credential') {
          message = "Wrong email or password.";
        } else if (e.code == 'invalid-email') {
          message = "Invalid email format.";
        } else {
          message = "Login failed. Try again.";
        }
        emit(AutheError(erroMessage: message));
      } catch (e) {
        emit(AutheError(erroMessage: e.toString()));
      }
    });
  }
}
