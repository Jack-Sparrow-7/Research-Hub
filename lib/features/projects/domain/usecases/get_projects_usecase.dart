import 'package:research_hub/features/projects/domain/entities/project_entity.dart';
import 'package:research_hub/features/projects/domain/repositories/project_repository.dart';

class GetProjectsUsecase {
  final ProjectRepository _projectRepository;

  GetProjectsUsecase({required ProjectRepository projectRepository})
    : _projectRepository = projectRepository;

  Future<List<ProjectEntity>> call() async {
    return await _projectRepository.getProjects();
  }
}
