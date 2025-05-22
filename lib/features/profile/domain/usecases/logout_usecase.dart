import 'package:research_hub/features/profile/domain/repositories/profile_repository.dart';

class LogoutUsecase {
  final ProfileRepository _profileRepository;

  LogoutUsecase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  Future<void> call() async {
    return _profileRepository.logoutRequested();
  }
}
