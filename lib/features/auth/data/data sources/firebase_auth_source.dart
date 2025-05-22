import 'package:firebase_auth/firebase_auth.dart';
import 'package:research_hub/features/auth/domain/entities/user_enitity.dart';

class FirebaseAuthSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthSource({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  Future<UserEnitity> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = result.user!;
    return UserEnitity(email: user.email!, uid: user.uid);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}