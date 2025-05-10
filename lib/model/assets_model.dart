class AssetsModel {
  final String favicon;
  final String profile;

  AssetsModel({required this.favicon, required this.profile});

  factory AssetsModel.fromMap(Map<String, dynamic> map) {
    return AssetsModel(
      favicon: map['favicon'] ?? '',
      profile: map['profileImage'] ?? '',
    );
  }
}
