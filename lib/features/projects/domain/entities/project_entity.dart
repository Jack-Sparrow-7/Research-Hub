
class ProjectEntity {
  final String title;
  final String id;
  final String overview;
  final String solution;
  final String results;
  final String futureImprovements;
  final bool funded;
  final List technologyStack;
  final List<TeamMember> team;
  final Mentor mentor;
  final List keyFeatures;
  final String domain;
  final String domainImage;
  final String video;
  final List images;
  final String domainId;
  final String image;
  final String category;
  final String categoryId;
  final String categoryImage;

  ProjectEntity({
    required this.categoryImage,
    required this.category,
    required this.categoryId,
    required this.image,
    required this.images,
    required this.domainImage,
    required this.video,
    required this.domain,
    required this.title,
    required this.id,
    required this.overview,
    required this.solution,
    required this.results,
    required this.futureImprovements,
    required this.funded,
    required this.technologyStack,
    required this.team,
    required this.mentor,
    required this.keyFeatures,
    required this.domainId,
  });
}

class TeamMember {
  final String name;
  final String role;

  TeamMember({required this.name, required this.role});
}

class Mentor {
  final String name;
  final String department;

  Mentor({required this.name, required this.department});
}
