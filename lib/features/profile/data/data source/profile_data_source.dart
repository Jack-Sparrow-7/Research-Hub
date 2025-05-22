import 'package:firebase_auth/firebase_auth.dart';

class ProfileDataSource {
  final FirebaseAuth _firebaseAuth;

  ProfileDataSource({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  Future<void> logoutRequested() => _firebaseAuth.signOut();
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = _firebaseAuth.currentUser;

    if (user == null || user.email == null) {
      throw Exception("no-user");
    }

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);
    await user.updatePassword(newPassword);
  }
}
