import 'package:flutter/widgets.dart';
import 'package:research_hub/features/projects/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.images,
    required super.domain,
    required super.title,
    required super.id,
    required super.overview,
    required super.solution,
    required super.results,
    required super.futureImprovements,
    required super.funded,
    required super.technologyStack,
    required super.team,
    required super.mentor,
    required super.keyFeatures,
    required super.domainImage,
    required super.video,
    required super.domainId,
    required super.image,
    required super.category,
    required super.categoryId, required super.categoryImage,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map, String id) {
    final list = map['technology_stack'];
    debugPrint(list.toString());
    return ProjectModel(
      categoryImage: map['category_image'],
      categoryId: map['category_id'],
      category: map['category'],
      image: map['image'],
      domainId: map['domain_id'],
      images: map['images'],
      video: map['video'],
      domainImage: map['domain_image'],
      domain: map['domain'],
      title: map['title'],
      id: id,
      overview: map['overview'],
      solution: map['solution'],
      results: map['results'],
      futureImprovements: map['future_improvements'],
      funded: map['funded'],
      technologyStack: map['technology_stack'],
      team:
          (map['team'] as List)
              .map(
                (member) =>
                    TeamMember(name: member['name'], role: member['role']),
              )
              .toList(),
      mentor: Mentor(
        name: map['mentor']['name'],
        department: map['mentor']['department'],
      ),
      keyFeatures: map['key_features'],
    );
  }
}
