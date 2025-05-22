import 'package:research_hub/features/auth/domain/entities/user_enitity.dart';
import 'package:research_hub/features/auth/domain/repositories/user_repository.dart';

class LoginUsecase {
  final UserRepository _userRepository;

  LoginUsecase({required UserRepository userRepository})
    : _userRepository = userRepository;

  Future<UserEnitity> call({required String email,required String password}) async {
    return await _userRepository.loginWithEmailPassword(email: email,password: password);
  }
}
