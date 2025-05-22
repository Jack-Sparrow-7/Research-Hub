abstract interface class ProfileRepository {
  Future<void> logoutRequested();
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
