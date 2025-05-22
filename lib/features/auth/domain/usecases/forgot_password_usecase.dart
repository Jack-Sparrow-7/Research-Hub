import 'package:research_hub/features/auth/domain/repositories/user_repository.dart';

class ForgotPasswordUsecase {
  final UserRepository _userRepository;

  ForgotPasswordUsecase({required UserRepository userRepository})
    : _userRepository = userRepository;

  Future<void> call({required String email}) async {
    return await _userRepository.forgotPasswrod(email: email);
  }
}
