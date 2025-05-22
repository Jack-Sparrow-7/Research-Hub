import 'package:research_hub/features/auth/data/data%20sources/firebase_auth_source.dart';
import 'package:research_hub/features/auth/domain/entities/user_enitity.dart';
import 'package:research_hub/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuthSource _firebaseAuthSource;

  UserRepositoryImpl({required FirebaseAuthSource firebaseAuthSource})
    : _firebaseAuthSource = firebaseAuthSource;

  @override
  Future<void> forgotPasswrod({required String email}) {
    return _firebaseAuthSource.sendPasswordResetEmail(email);
  }

  @override
  Future<UserEnitity> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuthSource.loginWithEmailPassword(
      email: email,
      password: password,
    );
  }
}
