import 'package:research_hub/features/auth/domain/entities/user_enitity.dart';

abstract interface class UserRepository {
  Future<UserEnitity> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<void> forgotPasswrod({required String email});
}
