class DashBoardModel {
  final String title;
  final String subtitle;
  final String image;

  DashBoardModel({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  factory DashBoardModel.fromMap(Map<String, dynamic> dashBoard) {
    return DashBoardModel(
      title: dashBoard['title'] ?? '',
      subtitle: dashBoard['count'] ?? '',
      image: dashBoard['image'] ?? '',
    );
  }
}
