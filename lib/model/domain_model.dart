class DomainModel {
  final String title;
  final String projectsCount;
  final String fundedProjectsCount;
  final String image;
  final String sub_1;
  final String sub_2;
  final List projects;
  final String description;

  DomainModel( {
    required this.title,
    required this.projectsCount,
    required this.fundedProjectsCount,
    required this.image,
    required this.sub_1,
    required this.sub_2,
    required this.projects, required this.description,
  });

  factory DomainModel.fromMap(Map<String, dynamic> domain) {
    return DomainModel(
      title: domain['title'] ?? '',
      projectsCount: domain['count'] ?? '',
      fundedProjectsCount: domain['funded'] ?? '',
      image: domain['image'] ?? '',
      sub_1: domain['sub_1'] ?? '',
      sub_2: domain['sub_2'] ?? '',
      projects: domain['projects'],
      description: domain['description']
    );
  }
}
