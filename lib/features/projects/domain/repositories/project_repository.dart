import 'package:research_hub/features/projects/domain/entities/project_entity.dart';

abstract interface class ProjectRepository {
  Future<List<ProjectEntity>> getProjects();
}
