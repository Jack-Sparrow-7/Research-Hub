import 'package:research_hub/features/profile/data/data%20source/profile_data_source.dart';
import 'package:research_hub/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl({required ProfileDataSource profileDataSource})
    : _profileDataSource = profileDataSource;
  @override
  Future<void> logoutRequested() => _profileDataSource.logoutRequested();

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await _profileDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
