import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated(user: _auth.currentUser!));
      } on FirebaseAuthException catch (e) {
        String message = "";
        if (e.code == 'invalid-credential') {
          message = "Wrong email or password.";
        } else if (e.code == 'invalid-email') {
          message = "Invalid email format.";
        } else {
          message = "Login failed. Try again.";
        }
        emit(AuthFailure(message: message));
      } catch (e) {
        String message = "An error occurred, Please Try again!";
        emit(AuthFailure(message: message));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await _auth.signOut();
      emit(AuthInitial());
    });

    on<UpdateProfile>((event, emit) async {
      try {
        final user = _auth.currentUser;
        if (user != null) {
          await user.updateProfile(displayName:  event.displayName,photoURL:  event.imageUrl);
          await user.reload();
          emit(
            Authenticated(
              user: user,
              displayName: user.displayName,
              imageUrl: user.photoURL,
            ),
          );
        }
      } catch (e) {
        String message = "An error occurred, Please Try again!";
        emit(AuthFailure(message: message));
      }
    });
  }
}
