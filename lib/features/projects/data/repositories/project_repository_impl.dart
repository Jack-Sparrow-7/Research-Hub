import 'package:research_hub/features/projects/data/data%20source/project_data_source.dart';
import 'package:research_hub/features/projects/domain/entities/project_entity.dart';
import 'package:research_hub/features/projects/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDataSource _projectDataSource;

  ProjectRepositoryImpl({required ProjectDataSource projectDataSource})
    : _projectDataSource = projectDataSource;
  @override
  Future<List<ProjectEntity>> getProjects() async {
    return await _projectDataSource.getProjects();
  }
}
