import 'package:research_hub/features/profile/domain/repositories/profile_repository.dart';

class ChangePasswordUsecase {
  final ProfileRepository _profileRepository;

  ChangePasswordUsecase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  Future<void> call({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await _profileRepository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
