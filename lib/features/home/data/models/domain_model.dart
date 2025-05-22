import 'package:research_hub/features/home/domain/entities/domain_entitiy.dart';

class DomainModel extends DomainEntitiy {
  DomainModel({
    required super.title,
    required super.projectsCount,
    required super.fundedProjectsCount,
    required super.image,
    required super.sub_1,
    required super.sub_2,
    required super.description,
    required super.domainId
  });

  factory DomainModel.fromMap(Map<String, dynamic> map) {
    return DomainModel(
      domainId: map['domain_id'],
      title: map['title'],
      projectsCount: map['count'],
      fundedProjectsCount: map['funded'],
      image: map['image'],
      sub_1: map['sub_1'],
      sub_2: map['sub_2'],
      description: map['description'],
    );
  }
}
